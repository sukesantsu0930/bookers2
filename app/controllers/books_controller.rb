class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]

    def index
        @books=Book.all
        @user=current_user
        @book=Book.new
    end
    
    def show
      @book1 = Book.find(params[:id])
      @book = Book.new
      @user = @book1.user
    end
    
    def new
    @book = Book.new
    flash[:notice] = "You have created book successfully."
    end

def edit
  set_book
  flash[:notice] = "You have updated book successfully."
  end

  # POST /books
  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      @books=Book.all
      @user=current_user
      render :index
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
   
    def set_book
      @book = Book.find(params[:id])
    end

  def correct_user
    unless @book.user == current_user
      redirect_to books_path
      end
    end
    
    def book_params
      params.require(:book).permit(:title, :body, :author, :description, :published_at)
    end
end
