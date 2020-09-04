class Api::V1::StudentsController < ApplicationController
    # GET /students
    def index
        @students = Student.all
        json_response(@students)
      end
end
