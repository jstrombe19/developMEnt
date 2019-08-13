class Api::V1::GoalsController < ApplicationController
  before_action :get_all_goals, only: [:index]
  before_action :find_this_goal, only: [:show, :edit, :update, :destroy]

  def index
    render json: @goals
  end

  def show
    render json: @goal
  end

  def create
    @goal = Goal.new
    @goal.name = params["name"]
    @goal.deadline = params["deadline"]
    @goal.icon = params["icon"]
    @goal.user_id = params["user_id"]
    @goal.save
  end

  def edit
    render json: @goal
  end

  def update
    @goal.update(goal_params)
    if @goal.save
      render json: @goal, status: :accepted
    else
      render json: { errors: @goal.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    Goal.destroy(@goal.id)
  end

  private

  def get_all_goals
    @goals = Goal.all
  end

  def find_this_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:id, :name, :deadline, :icon, :user_id)
  end

end
