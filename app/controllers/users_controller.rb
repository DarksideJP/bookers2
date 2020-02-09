class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render :show, notice: "error"
    end
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
