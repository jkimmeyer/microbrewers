module Api
  module V1
    class CrowdBrewsController < ApplicationController
      def index
        @crowd_brews = CrowdBrew.all

        render json: @crowd_brews.to_json
      end

      def create
        @crowd_brew = CrowdBrew.new(crowd_brew_params)

        if @crowd_brew.save
          render json: @crowd_brew.to_json
        else
          render json: { errors: @crowd_brew.errors }, status: :not_acceptable
        end
      end

      def show
        @crowd_brew = CrowdBrew.find(params[:id])

        render json: @crowd_brew.to_json
      end

      def update
        @crowd_brew = CrowdBrew.find(params[:id])

        if @crowd_brew.update(crowd_brew_params)
          render json: @crowd_brew.to_json
        else
          render json: { errors: @crowd_brew.errors }, status: :not_acceptable
        end
      end

      private

      def crowd_brew_params
        params.require(:crowd_brew).permit(
          :producing_at,
          :crowd_brew_until,
          :crowd_brew_from,
          :amount,
        )
      end
    end
  end
end
