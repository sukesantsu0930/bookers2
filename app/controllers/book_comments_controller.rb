class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to book_path(@book)
    else
      redirect_to book_path(@book)
    end
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_to book_path(@comment.book)
end

  private

  def comment_params
    params.require(:book_comment).permit(:comment)
  end

  def correct_user
      @comment=BookComment.find(params[:id])
     unless @comment.user == current_user
      redirect_to book_path(@comment.book)
      end
  end
end
