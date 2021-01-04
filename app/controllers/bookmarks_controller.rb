class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    @bookmark.save!
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(board_id: params[:board_id])
    @bookmark.destroy!
  end
end
