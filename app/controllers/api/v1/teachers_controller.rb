# frozen_string_literal: true

class Api::V1::TeachersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  before_action :set_teacher, only: %i[show update destroy]
  # before_action :is_admin?, only: [:create, :update, :destroy]

  # GET /teachers
  def index
    @teachers = Teacher.all
    json_response(@teachers)
    end

  # POST /api/v1/teachers
  # return authenticated token upon create
  def create
    if current_user.admin?
      teacher = Teacher.create!(teacher_params)
      json_response(response, :created)
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # GET /api/v1/teachers/:id
  def show
    json_response(@teacher)
  end

  # PUT /api/v1/teachers/:id
  def update
    if current_user.admin?
      @teacher.update(teacher_params)
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

  # DELETE /api/v1/teachers/:id
  def destroy
    if current_user.admin?
      @teacher.destroy
      head :no_content
    else
      render(json: { message: Message.unauthorized }, status: 401)
    end
  end

    private

  def teacher_params
    params.permit(:name, :email, :nationality, :languages, :bio, :password)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
  end
