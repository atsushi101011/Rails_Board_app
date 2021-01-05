class BoardsController < ApplicationController
  before_action :require_login
  before_action :find_board, only: %i[edit update destroy]

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc).page params[:page]
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
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board, success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('.success')
  end

  def bookmarks
    @boards = current_user.bookmark_boards.includes(:user).order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

  def find_board
    @board = current_user.boards.find(params[:id])
  end
end
