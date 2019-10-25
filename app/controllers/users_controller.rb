class UsersController < ApplicationController
    before_action :authorize_request, except: :create

    def show
        @user = User.find(params[:id])

        render json: @user, include: :beers
    end
    
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
