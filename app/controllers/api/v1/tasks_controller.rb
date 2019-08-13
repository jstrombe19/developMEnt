class Api::V1::TasksController < ApplicationController
  before_action :get_all_tasks, only: [:index]
  before_action :find_this_task, only: [:show, :edit, :update, :destroy]

  def index
    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new
    @task.title = params["title"]
    @task.start_date = params["start_date"]
    @task.complete = params["complete"]
    @task.goal_id = params["goal_id"]
    @task.save
  end

  def edit
    render json: @task
  end

  def update
    @task.update(task_params)
    if @task.save
      render json: @task, status: :accepted
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    Task.destroy(@task.id)
  end

  private

  def get_all_tasks
    @tasks = Task.all
  end

  def find_this_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id, :title, :start_date, :complete, :goal_id)
  end

end
