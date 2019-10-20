require 'rest-client'

class BeersController < ApplicationController
    before_action :set_beer, only: [:show, :update]

    def index
        # beer_id = get_beer_id("Liberty Blonde")
        @beers = Beer.all 
            
        render json: @beers
        
    end
    
    
    def show
        # beer_id = get_beer_id(params[:name])
        

        # rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/beer/#{beer_id}/?key=#{ENV['API_KEY']}") 
        # # rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/beers/'3Csw32'/?key=#{ENV['API_KEY']}") 
        # # 3Csw32
        # response = JSON.parse(rest_client)

        render json: @beer
    end     
    
    
    def create
        
    #     # @beer = Beer.new(beer_params) 

    #     # if @beer.save
    #     #     render json: @beer, status: :created, location: @beer
    #     # else
    #     #     render json: @beer.errors, status: :unprocessable_entity
    #     # end
    end


    def update
        if @beer.update(beer_params)
          render json: @beer
        else
          render json: @beer.errors, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
        @beer = Beer.find(params[:id])
    end  

    def get_beer_id(beer_name)
        # rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/beers/?key=#{ENV['API_KEY']}")
        # rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/search?q=#{beer_name}&key=#{ENV['API_KEY']}") 
        rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/search?q=#{beer_name}&key=#{ENV['API_KEY']}") 
        response = JSON.parse(rest_client)
        
        selected_beer = response["data"].find do |beer| 
            beer["name"] === beer_name
        end       
        selected_beer["id"]    
        byebug
    end

    # Only allow a trusted parameter "white list" through.
    def beer_params
        params.require(:beer).permit(:name, :variety, :rating, :comments)
    end
end
