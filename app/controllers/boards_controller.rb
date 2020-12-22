class BoardsController < ApplicationController
  before_action :require_login, only: :index

  def index
    @boards = Board.all
  end
end
