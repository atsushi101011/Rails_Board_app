class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to board_path(params[:board_id]), success: t('.success')
    else
      flash[:danger] = t('.fail')
      redirect_to board_path(params[:board_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
