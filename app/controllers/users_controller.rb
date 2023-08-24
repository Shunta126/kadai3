class UsersController < ApplicationController
  def index
     @user = User.find(current_user.id)
      @book = Book.new
     @users = User.all
  end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    users =  User.find(params[:id])
    @post_image = PostImage.new
    users.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(users.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction )
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def post_image_params
     params.require(:post_image).permit(:shop_name, :image, :caption)
  end


end
