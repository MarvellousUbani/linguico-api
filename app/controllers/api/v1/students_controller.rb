class Api::V1::StudentsController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_student, only: [:show, :update, :destroy]
  # GET /students
  def index
      @students = Student.all
      json_response(@students)
    end

  # POST /api/v1/students
  # return authenticated token upon create
  def create
    student = Student.create!(student_params)
    auth_token = AuthenticateStudent.new(student.email, student.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /api/v1/students/:id
  def show
    json_response(@student)
  end

  # PUT /api/v1/students/:id
  def update
    @student.update(student_params)
    head :no_content
  end

  # DELETE /api/v1/students/:id
  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name, :email, :nationality, :languages, :bio, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
