class LikesController < ApplicationController

  def index
    @likes = current_user.likes.all
  end

  def create
    book = Book.find(params[:book_id])
    like = current_user.likes.new(book_id: book.id)
    like.save
    redirect_to request.referrer, notice: "お気に入りに登録しました"
  end

  def destroy
    book = Book.find(params[:book_id])
    like = current_user.likes.find_by(book_id: book.id)
    like.destroy
    redirect_to request.referrer, notice: "お気に入りから削除しました"
  end

end
