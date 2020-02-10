class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end


  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render "users/show", notice: "error"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
  end

  private

  def book_params
  	params.require(:book).permit(:title,:body, :user_id)
  end


end
