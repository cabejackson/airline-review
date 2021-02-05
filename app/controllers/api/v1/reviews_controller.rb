module Api
    module V1
        class ReviewsController < ApplicationController

            def create
                review = Review.new(review_params)
            #if everythings valid, then we want to save our new review
                if review.save
                    render json: ReviewSerializer.new(review).serialized_json
               #if for some reason we can't save the review
               #return an error w/ the message describinig what went wrong
                else
                    render json: { error: review.errors.messages }, status: 422
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

            private

            def review_params
                params.require(:review).permit(:title, :description, :score, :airline_id)
            end
        end
    end
end
