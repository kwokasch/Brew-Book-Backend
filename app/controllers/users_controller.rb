class UsersController < ApplicationController
    def index
        @users = User.all

        render json: @users
    end

    def create
        @user = User.create(user_params)

        if @user.save
            render status: :created
        else 
            render status: :bad_request
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
