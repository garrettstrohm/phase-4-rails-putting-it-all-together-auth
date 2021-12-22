class RecipesController < ApplicationController
    before_action :authorize
    
    def index
        # if current_user
            render json: Recipe.all, status: :ok
        # else
        #     render json: {errors: ["Not authorized"]}, status: :unauthorized
        # end
    end

    def create
        # if current_user
            recipe = current_user.recipes.create!(recipe_params)
            render json: recipe, status: :created
        # else
        #     render json: {errors: ["Not authorized"]}, status: :unauthorized
        # end
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

end
