class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
    puts "作成したキー #{ENV['SECRET_KEY']}"
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	redirect_to @book, notice:'Book was successfully created.'
    else
    @books = Book.all
    render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	redirect_to @book, notice:'Book was successfully updated.'
    else
    render :edit
    end
  end
  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
    redirect_to @book, notice:'Book was successfully destroyed.'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
