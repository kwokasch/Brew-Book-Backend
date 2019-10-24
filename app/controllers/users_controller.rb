class UsersController < ApplicationController
      def create
        @user = User.new({
            username: params[:username],
            password: params[:password]
        })

        if @user.valid?
            @user.save
            render json: @user, status: :created
        else 
            render status: :bad_request
        end
    end
end
