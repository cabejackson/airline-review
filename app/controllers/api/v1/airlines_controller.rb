module Api
    module V1
        class AirlinesController < ApplicationController
            # start with index method
            def index
                #get all the airlines from db, then render data using airlines serializer
                airlines = Airline.all
                #pass that value into airline serializer
                render json: AirlineSerializer.new(airlines, options).serialized_json
            end
            
            
            def show 
                #find airline based off of slug param
                airline = airline.find_by(slug: params[:slug])
                #same as above, but just passing in the individual airline
                render json: AirlineSerializer.new(airline, options).serialized_json
            end

            def create
                #'add strong parameters" what does that mean?
                #
                airline = Airline.new(airline.params)
                
            #if we're able to save the record & everything's valid 
            #render the json "object" -- review json objects
                if airline.save
                    render json: AirlineSerializer.new(airline).serialized_json
            #otherwise render out some sort of error message
                else
                    render json: { error: ariline.errors.messages }, status: 422
                end
            end

            #update method is v similar to create method above
            #except do find_by instead of creating a new instance 
            #(instead of .new  do .find_by)
            def update
                airline = Airline.find_by(slug: params[:slug])
            #if we're able to update the record and everything's valid 
            #render the json "object"
                if airline.update
                    render json: AirlineSerializer.new(airline, options).serialized_json
            #otherwise render out some sort of error message
                else
                    render json: { error: ariline.errors.messages }, status: 422
                end
            end

            def destory
            #find airline by it's param
                airline = Airline.find_by(slug: params[:slug])
                
            #if we're able to save the record and everything's valid render the json "object"
                if airline.destroy
                    head :no_content
            #otherwise render out some sort of error message
                else
                    render json: { error: ariline.errors.messages }, status: 422
                end
            end

            def airline_params
                #setup allow list of the parameters we want to allow here, ie name, image url (just those 2 for now)
                params.require(:airline).permit(:name, :image_url)
            end

            def options
                @options ||= { include: %i[reviews]}
            end



        end
    end
end
