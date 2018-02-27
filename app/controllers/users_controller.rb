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
  end
end
