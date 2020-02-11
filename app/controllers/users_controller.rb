class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users =User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def new
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end


  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
end
end
