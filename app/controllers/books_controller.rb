class BooksController < ApplicationController
  before_action :auth_user
  before_action :set_book, except: [:index, :new, :create]

  def index
    @books = current_user.books
  end

  def new
  	@book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)

    respond_to do |format|
      if @book.save
        @book.user_memberships.create(user_id: current_user.id, permission_group: 0)
        format.html { redirect_to book_path(@book.token) }
      else
        format.js { render js: @book.errors.full_messages }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path(@book.token) }
      else
        format.js { render js: @book.errors.full_messages }
      end
    end
  end

  def create_member
    @new_membership = @book.user_memberships.new(membership_params)
    respond_to do |format|
      if @new_membership.save
        format.js
      else
        format.js { render js: @new_membership.errors.full_messages }
      end
    end
  end

  def fetch_users
    @result = User.search(params[:word]) - @book.members
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def create_item
    params[:item][:price] = params[:item][:price].to_i * [-1, 1][params[:item][:sign].to_i]
    params[:item][:flows_attributes].each do |index, flow|
      flow[:number] = flow[:number].to_i * [-1, 1][flow[:sign].to_i]
    end

    respond_to do |format|
      @item = @book.items.new(item_params)
      if @item.save
        # TODO: This @members_arr may be different with original list
        @members_arr = @book.user_memberships.map {|member| member.name }
        format.js
      else
        format.js { render js: @item.errors.full_messages }
      end
    end
  end

  def delete_item
    item = @book.items.find(params[:item_id])
    item.destroy

    respond_to do |format|
      format.js
    end
  end

  private
    def set_book
      @book = current_user.books.find_by(token: params[:token])
      raise ActionController::RoutingError.new('Not Found') unless @book
    end

    def book_params
      params.require(:book).permit(:name, :currency_name)
    end
    def membership_params
      params.require(:membership).permit(:user_id, :nickname)
    end
    def item_params
      params.require(:item).permit(:title, :price, :time, flows_attributes: [:membership_id, :number])
    end
end
