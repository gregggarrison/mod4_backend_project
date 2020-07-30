class ApplicationController < ActionController::API
    before_action :authorized
    skip_before_action :authorized, only: [:login]
   
    def encode_token(payload)
      JWT.encode(payload, 'yerrr')
    end
   
    def auth_header
      request.headers['Authorization']
    end
   
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, 'yerrr', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
   
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
   
    def logged_in?
      !!current_user
    end
   
    def authorized
      # byebug
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end