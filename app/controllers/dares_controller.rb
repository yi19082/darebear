class DaresController < ApplicationController

  def index
    @comment = Comment.new
    @dares = current_user.dares_to_receive
  end

  def new
    @dare = Dare.new
  end

  def recent
    @comment = Comment.new
    @dares = Dare.order(created_at: :desc).take(10)
  end

  def upvote
    @dare=Dare.find(params[:id])
    @dare.upvote_by(current_user)
    redirect_to :back
  end


  def create
    dare = Dare.new(dare_parameters)
    if dare.save
      redirect_to :back, flash: {notice: 'Successfully created a dare.'}
    else
      redirect_to :back, flash: {danger: 'Unable to process your request.'}
    end
  end

  def search
    if params[:search].blank?
      redirect_to :back
    else
      @dares = Dare.search(params[:search])
    end
  end

  private

  def dare_parameters
    params.require(:dare).permit(:dare_recepient_id, :description).merge(dare_giver: current_user)
  end
end

