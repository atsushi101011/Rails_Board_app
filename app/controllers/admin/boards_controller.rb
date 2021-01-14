class Admin::BoardsController < Admin::Base
  before_action :require_login
  before_action :find_board, only: %i[edit update destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end


  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path(@board.id), success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: t('.success')
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

  def find_board
    @board = Board.find(params[:id])
  end
end
