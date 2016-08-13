class UserBoardsController < ApplicationController
  def index
    @user_boards = UserBoard.where(user_id: current_user.id)
  end

  def create
    if user_board = UserBoard.create(user_board_params)
      redirect_to user_boards_path
    else
      redirect_to user_boards_path, alert: "Error saving board"
    end
  end

  def destroy
    user_board = UserBoard.find(params[:id])
    user_board.destroy
    redirect_to user_boards_path
  end
end
