class BooksController < ApplicationController
  before_action :auth_user

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
        format.html { redirect_to book_token_path(@book.token) }
      else
        format.js { render js: @book.errors.full_messages }
      end
    end
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    @book = current_user.books.find(params[:id])

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_token_path(@book.token) }
      else
        format.js { render js: @book.errors.full_messages }
      end
    end
  end

  def book
    @book = Book.find_by(token: params[:token])
    raise ActionController::RoutingError.new('Not Found') unless @book
  end

  private
    def book_params
      params.require(:book).permit(:name, :currency_name)
    end
end
