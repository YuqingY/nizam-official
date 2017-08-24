class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @ticket = Ticket.find(params[:ticket_id])
    @user = current_user
  end

  def create
    @comment = Comment.new
    @ticket = Ticket.find(params[:ticket_id])
    @user
    @comment.save
    redirect_to ticekt_path(@dose.cocktail), notice: 'Dose was successfully created.'
  end

  private
  def comments_params
    params.require(:comment).permit(:text, :ticket_id, :user_id)
  end
end
