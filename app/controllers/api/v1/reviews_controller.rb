module Api
    module V1
        class ReviewsController < ApplicationController
            protect_from_forgery with: :null_session

            def create
                review = airline.reviews.new(review_params)
            #if everythings valid, then we want to save our new review
                if review.save
                    render json: ReviewSerializer.new(review).serializable_hash.to_json
               #if for some reason we can't save the review
               #return an error w/ the message describinig what went wrong
                else
                    render json: { error: review.errors.messages }, status: 422
            end
        end
            
            def destroy
                review = Review.find(params[:id])
            #if everythings valid, then we want to save our new review
                if review.destroy
                    head :no_content
               #if for some reason we can't save the review
               #return an error w/ the message describinig what went wrong
                else
                    render json: { error: review.errors.messages }, status: 422
            end
        end


            private

            # passing through airline as a param now
            def airline
                @airline ||= Airline.find(params[:airline_id])
            end

            def review_params
                params.require(:review).permit(:title, :description, :score, :airline_id)
            end
        end
    end
end
