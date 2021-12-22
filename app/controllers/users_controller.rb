class UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:create]
    
    def show
        # if current_user
            render json: current_user, status: :ok
        # else
        #     render json: "No current user session is stored", status: :unauthorized
        # end
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

end
