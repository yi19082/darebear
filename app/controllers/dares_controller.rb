class DaresController < ApplicationController

  def index
    @dares = current_user.dares_to_receive
  end

  def new
    @dare = Dare.new
  end

  def feed
    @all_dares = Dare.order(created_at: :desc).take(10)
  end

  def create
    dare = Dare.new(dare_parameters)
    if dare.save
      redirect_to :back, flash: {notice: 'Successfully created a dare.'}
    else
      redirect_to :back, flash: {danger: 'Unable to process your request.'}
    end
  end

  private

  def dare_parameters
    params.require(:dare).permit(:dare_recepient_id, :description).merge(dare_giver: current_user)
  end
end
