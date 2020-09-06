class Api::V1::TeachersController < ApplicationController
    # skip_before_action :authorize_request, only: :create
    before_action :set_teacher, only: [:show, :update, :destroy]
    # GET /teachers
    def index
        @teachers = Teacher.all
        json_response(@teachers)
      end
  
    # POST /api/v1/teachers
    # return authenticated token upon create
    def create
      teacher = Teacher.create!(teacher_params)
      json_response(response, :created)
    end
  
    # GET /api/v1/teachers/:id
    def show
      json_response(@teacher)
    end
  
    # PUT /api/v1/teachers/:id
    def update
      @teacher.update(teacher_params)
      head :no_content
    end
  
    # DELETE /api/v1/teachers/:id
    def destroy
      @teacher.destroy
      head :no_content
    end
  
    private
  
    def teacher_params
      params.permit(:name, :email, :nationality, :languages, :bio, :password)
    end
  
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  end
  
