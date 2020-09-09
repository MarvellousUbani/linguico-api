# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: %i[show update destroy]
  # GET /users
  def index
    @users = User.all
    json_response(@users)
    end

  # POST /api/v1/users
  # return authenticated token upon create
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /api/v1/users/:id
  def show
    json_response(@user)
  end

  # PUT /api/v1/users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :nationality, :role, :languages, :bio, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
