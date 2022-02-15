module Api
  module V1
    class CraftBeersController < Api::ApplicationController
      def create
        @craft_beer = CraftBeer.new(craft_beer_params)

        if @craft_beer.save
          render json: @craft_beer
        else
          render json: { errors: @craft_beer.errors }
        end
      end

      private

      def craft_beer_params
        params.require(:craft_beer).permit(%i[
                                             name
                                             description
                                             international_bitterness_unit
                                             alcohol_volume
                                             price
                                             flavor
                                             color
                                             hop
                                             craft_beer_type_id
                                           ])
      end
    end
  end
end
