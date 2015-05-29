class Api::V1::UsersController < ApplicationController
  respond_to :json
  before_action :set_user, only: [:update, :destroy]

  def index
    render json: User.all
  end

  def create
    user = User.new(params_user)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update
    if @user.update(params_user)
      render json: :@user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    if @user.save
      render json: @user
    else
      render @user.errors, status: :bad_request
    end
  end

  def params_user
    binding.pry
    params.require(:user).permit(:name, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
