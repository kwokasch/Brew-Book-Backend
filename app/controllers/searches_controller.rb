class SearchesController < ApplicationController

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

    def create
        
        user_input = params["beer"]["name"]
        
        beer_exists = Beer.all.any? {|beer| beer["name"] == user_input} 
        
        if beer_exists
            render json: {message: "Beer already exists."}
        elsif beer_id = get_beer_id(user_input)
            rest_client = RestClient.get("https://sandbox-api.brewerydb.com/v2/beer/#{beer_id}/?key=#{ENV['API_KEY']}") 
            response = JSON.parse(rest_client)

            @beer = Beer.create({
                api_id: response["data"]["id"],
                name: response["data"]["name"], 
                variety: response["data"]["style"]["name"],
                rating: 0,
                comments: response["data"]["style"]["description"]
                })
        else
            render json: {message: "Please create a new beer."}
        end
    end 
end
