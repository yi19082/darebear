class CommentsController < ApplicationController

  def new
    @dare = Dare.find(params[:dare_id])
    @comment = Comment.new
  end

  def create
    @dare = Dare.find(params[:dare_id])
    @comment = Comment.new(comment_params)
    @comment.user_id= current_user.id
  
    if @comment.save
      redirect_to :back
    else
      redirect_to :back, flash: {danger: 'Unable to process your request.'}
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to :back
  end

  private
  def comment_params
      params.require(:comment).permit(:text, :dare_id)
  end
end
