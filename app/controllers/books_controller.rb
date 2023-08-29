class BooksController < ApplicationController

  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

   def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end



  def edit
     @book = Book.find(params[:id])
  end

   def update
    @user = User.find(current_user.id)
    @books = Book.all
    @book =  Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end