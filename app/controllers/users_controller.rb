class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
      @users = User.all 
      render json: @users, include: :meals
    end 

    def profile
      render json:{ user: current_user, meals: current_user.meals}, status: :accepted
    end

    def create
      @user = User.create(user_params)
        if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: {user: @user, meals: @user.meals, jwt: @token}, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def update
      @user.update(user_params)
      render json: @user
    end

    def destroy
      @user.destroy
      render status: :no_content
    end
    
  private

  def user_params
      params.require(:user).permit(:username, :password, :age, :sex, :height, :weight)
  end

end
