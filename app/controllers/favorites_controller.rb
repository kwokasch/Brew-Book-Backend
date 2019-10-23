class FavoritesController < ApplicationController
    def index
        @favorites = Favorite.all

        render json: @favorites
    end

    def create
        @favorite = Favorite.create(favorite_params)

        if @favorite.save
            render status: :created
        else 
            render status: :bad_request
        end
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy

        redirect to "http://localhost:3001/beer.html"
    end

    private

    def favorite_params
        params.permit(:user_id, :beer_id)
    end
end
