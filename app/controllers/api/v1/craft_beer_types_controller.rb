module Api
  module V1
    class CraftBeerTypesController < Api::BaseController
      skip_before_action :authenticate_user!

      def index
        @craft_beer_types = CraftBeerType.all

        render json: @craft_beer_types
      end
    end
  end
end
