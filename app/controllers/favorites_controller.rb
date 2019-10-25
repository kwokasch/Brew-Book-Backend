class FavoritesController < ApplicationController
    def index
        @favorites = Favorite.all

        render json: @favorites
    end

    def create
        @favorite = Favorite.new({
            user_id: params[:user_id],
            beer_id: params[:beer_id]
        })

        if @favorite.save
            render json: @favorite, status: :created
        else 
            render status: :bad_request
        end

    end

    def destroy
        @favorite = Favorite.find(user_id: params[:user_id], beer_id: params[:beer_id])
        
        @favorite.destroy

        redirect to "http://localhost:3001/beer.html"
    end
end
