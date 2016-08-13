class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @user = current_user || User.new
  end

  def show
    @board = Board.find(params[:id])
    @user = current_user
  end

  def new
    if current_user
      @board = Board.new
      @user = current_user
    else
      redirect_to boards_path, alert: "You need an account to make a board"
    end
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

  def destroy

    board = Board.find(params[:id])
    if board.owner == current_user
      board.destroy
      redirect_to boards_path, alert: "Board destroyed"
    else
      redirect_to boards_path, alert: "You do not have permissions to delete that board"
    end
  end

  private
    def board_params
      params.require(:board).permit(:owner_id, :title, :description)
    end
end
