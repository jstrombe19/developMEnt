class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    render json: @current_user
  end

  def create
    @user = User.new
    @user.name = params["name"]
    @user.email = params["email"]
    @user.password = params["password"]
    @user.password_confirmation = params["password_confirmation"]
    @user.save
  end

  def edit
    render json: @current_user
  end

  def update
    @current_user.update(user_params)
    if @current_user.save
      render json: @current_user, status: :accepted
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    User.destroy(@current_user.id)
  end

  private

  def find_user
    @current_user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :password_digest)
  end

end
