class BooksController < ApplicationController
  def index
    @books = current_user.books
  end

  def create
  end

  def show
  end
end
