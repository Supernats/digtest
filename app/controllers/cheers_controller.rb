class CheersController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_id])
    current_user.make_cheer!(@goal)
    flash[:notices] = ["#{current_user.username} cheered this goal!"]
    redirect_to goal_url(@goal)
  end

end
