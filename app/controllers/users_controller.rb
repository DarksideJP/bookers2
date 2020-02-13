class UsersController < ApplicationController
 before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    if @user == current_user
    else
      @user = User.find(current_user.id)
      redirect_to user_path(@user.id)
    end
  end

  def new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user.id), notice: "You have updated user successfully.

"
  else
    render :edit
  end
  end


  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
end
end
