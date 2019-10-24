class UsersController < ApplicationController
    before_action :authorize_request, except: :create

    def create
        @user = User.new({
            username: params[:username],
            password: params[:password]
        })

        if @user.save
            render json: @user, status: :created
        else
            render json: { errors: @user.errors.full_messages },
                status: :unprocessable_entity
        end
    end
end
