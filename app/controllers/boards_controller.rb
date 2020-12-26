class BoardsController < ApplicationController
  before_action :require_login

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
    # @comments = Comment.all.includes(:board).order(created_at: :desc)
  end

  def edit
    if current_user == set_board.user
      @board = Board.find(params[:id])
    end
  end

  def update
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    if current_user == set_board.user
      @board.destroy
      redirect_to boards_path, success: t('.success')
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

  def set_board
    @board =current_user.boards.find(params[:id])
  end
end
