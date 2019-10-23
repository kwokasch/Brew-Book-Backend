require 'rest-client'

class BeersController < ApplicationController

    def index
        @beers = Beer.all 
        
        render json: @beers
    end
    
    def show
        
        beer_id = get_beer_id(params[:name])

        rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/beer/#{beer_id}/?key=#{ENV['API_KEY']}") 
        response = JSON.parse(rest_client)

        @beer = Beer.find(params[:id])
        
        render json: @beer
    end     
    
    def create
        @beer = Beer.create({
            name: params["name"], 
            variety: params["variety"],
            rating: params["rating"],
            comments: params["comments"]
            })

        redirect_to "http://localhost:3001"
    end

    def update
        @beer = Beer.update(beer_params)
          
        render json: @beer
    end

    private

    def get_beer_id(beer_name)
        rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/search?q=#{beer_name}&key=#{ENV['API_KEY']}") 
        
        response = JSON.parse(rest_client)
        beers = response["data"]

        if beers
            selected_beer = beers.find do |beer| 
                beer["name"] === beer_name
            end       
            selected_beer["id"]
        else
            nil
        end
        
    end

    def beer_params
        params.require(:beer).permit(:id, :api_id, :name, :variety, :rating, :comments)
    end
end
