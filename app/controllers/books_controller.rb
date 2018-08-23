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
        format.html { redirect_to books_url }
      else
        format.js { render js: @book.errors.full_messages }
      end
    end
  end

  def show
  end

  private
    def book_params
      params.require(:book).permit(:name, :currency_name)
    end
end
