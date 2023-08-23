class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = User.find(current_user.id)

  end

   def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end



  def edit
     @book = Book.find(params[:id])
  end


  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
