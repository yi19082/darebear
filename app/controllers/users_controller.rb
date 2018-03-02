class UsersController < ApplicationController

  def search
    if params[:search].blank?
      redirect_to :back
    else
      @users = User.search(params[:search])
    end
  end

  def show
    @user = User.find(params[:id])
    @dares = @user.dares_to_receive
  end

  def dareboard
    @comment=Comment.new
    @user = User.find(params[:id])
    @dares = @user.dares_to_receive
  end

  def pending
    @user=get_user
    @dares = @user.dares_to_receive.pending
  end

  def accepted
    @user=get_user
    @dares = @user.dares_to_receive.accepted
  end

  def completed
    @user=get_user
    @dares = @user.dares_to_receive.completed
  end


  def get_user
    if params[:id].present?
      @user = User.find(params[:id])
      print "another user"
    else
      @user = current_user
      print "cur user"
    end
    @user
  end

end
