module Api
  module V1
    class CraftBeerTypesController < Api::ApplicationController
      def index
        @craft_beer_types = CraftBeerType.all

        render json: @craft_beer_types
      end
    end
  end
end
