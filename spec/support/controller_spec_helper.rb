module ControllerSpecHelper
    # generate tokens from student id
    def token_generator(student_id)
      JsonWebToken.encode(student_id: student_id)
    end
  
    # generate expired tokens from student id
    def expired_token_generator(student_id)
      JsonWebToken.encode({ student_id: student_id }, (Time.now.to_i - 10))
    end
  
    # return valid headers
    def valid_headers
      {
        "Authorization" => token_generator(1),
        "Content-Type" => "application/json"
      }
    end
  
    # return invalid headers
    def invalid_headers
      {
        "Authorization" => nil,
        "Content-Type" => "application/json"
      }
    end
  end