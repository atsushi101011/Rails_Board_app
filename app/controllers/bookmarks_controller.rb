class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save!
    redirect_to boards_path, success: t('.flash_bookmark')
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(board_id: params[:board_id])
    bookmark.destroy!
    redirect_to boards_path, success: t('.flash_not_bookmark')
  end
end
