class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @user = current_user
  end

  def create
    if board = Board.create(board_params)
      redirect_to board_path(board)
    else
      render :new, alert: "There was an error processing your board"
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    if board.update(board_params)
      redirect_to board_path(board)
    else
      render :edit, alert: "There was an error updating your board"
    end
  end

  private
    def board_params
      params.require(:board).permit(:owner_id, :title, :description)
    end
end
