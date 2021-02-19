module Api
    module V1
        class AirlinesController < ApplicationController
            protect_from_forgery with: :null_session


      # GET /api/v1/airlines
            def index
                #get all the airlines from db, then render data using airlines serializer
                airlines = Airline.all
                #pass that value into airline serializer
                render json: AirlineSerializer.new(airlines).serializable_hash.to_json
                # (airlines, options).serialized_json
            end
            
            #specific method for showing ea airline
            def show 
                #find airline based off of slug param
                airline = Airline.find_by(slug: params[:slug])
               # byebug
                #same as index above, but just passing in the individual airline
                render json: AirlineSerializer.new(airline, options).serializable_hash.to_json
            end

            def create
                #'add strong parameters" what does that mean?
                airline = Airline.new(airline_params)
                
            #if we're able to save the record & everything's valid 
            #render the json object
                if airline.save
                    render json: AirlineSerializer.new(airline).serializable_hash.to_json
            #otherwise render out some sort of error message
                else
                    render json: { error: airline.errors.messages }, status: 422
                end
            end

            

            #update method is v similar to create method above
            #except do find_by to look for the airline & update it instead of creating a new instance 
            def update
                airline = Airline.find_by(slug: params[:slug])
            #if we're able to update the record and everything's valid 
            #render the json object
                if airline.update(airline_params)
                    render json: AirlineSerializer.new(airline, options).serializable_hash.to_json #.serialized_json
            #otherwise render out some sort of error message
                else
                    render json: { error: airline.errors.messages }, status: 422
                end
            end

            def destroy
            #find specific airline by it's param
                airline = Airline.find_by(slug: params[:slug])
                
            #if we're able to save the record and everything's valid render the json object
                if airline.destroy
                    head :no_content
            #otherwise render out some sort of error message
                else
                    render json: { error: airline.errors.messages }, status: 422
                end
            end

            

            #private methods?
            private 

            def airline_params
                #setup allow list of the parameters to allow, ie name, image url
                params.require(:airline).permit(:name, :image_url)
            end

            #structures response as a compound document
            def options
                @options ||= { include: %i[reviews]}
            end

        end
    end
end
