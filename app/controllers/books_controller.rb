class BooksController < ApplicationController
  def index
    # @books = Book.joins(:user).select("books.*, users.profile_image_id")
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def new
  end


  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = User.find(current_user.id)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render "index", notice: "error"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  private

  def book_params
  	params.require(:book).permit(:title,:body, :user_id)
  end


end
