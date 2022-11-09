class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else 
      @books = Book.all.order(id: :ASC)
      render :index
    end 
  end 

  def index
    @books = Book.all.order(id: :ASC)
    
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end 
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end 
end
