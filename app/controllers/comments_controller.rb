class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.dare_id = params[:dare_id]
    if comment.save
      redirect_to :back, flash: {notice: "Comment posted."}
    else
      redirect_to :back, flash: {danger: 'Unable to process your request.'}
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back, flash: {notice: "Comment deleted."}
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end
end
