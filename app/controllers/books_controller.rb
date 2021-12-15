class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
    @libraries = Library.all
  end

  def create
    @book = Book.new(params_book)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @authors = Author.all
    @categories = Category.all
    @libraries = Library.all
  end

  def update
    if @book.update(params_book)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def params_book
    params.require(:book).permit(:parution_date, :title, :library_id, :category_id, :author_id)
  end
end
