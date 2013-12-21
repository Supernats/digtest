class GoalsController < ApplicationController

  before_filter :authenticate, :only => [:create, :new, :edit, :update]

  def create
    params[:goal][:owner_id] = current_user.id
    @goal = Goal.new(params[:goal])
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def index
    @created_goals = current_user.created_goals
    render :index
  end

  def new
    @goal = Goal.new
    render :new
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

end
