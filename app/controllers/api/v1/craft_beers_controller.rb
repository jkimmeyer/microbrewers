module Api
  module V1
    class CraftBeersController < Api::BaseController
      skip_before_action :authenticate_user!, only: [:index]
      def index
        @craft_beers = CraftBeer.all.with_attached_craft_beer_image

        render json: craft_beers_as_json(@craft_beers)
      end

      def create
        @craft_beer = CraftBeer.new(craft_beer_params)

        if @craft_beer.save
          render json: @craft_beer
        else
          render json: { errors: @craft_beer.errors }, status: :not_acceptable
        end
      end

      private

      def craft_beer_params
        params.require(:craft_beer).permit(
          :name,
          :craft_beer_image,
          :description,
          :international_bitterness_unit,
          :alcohol_volume,
          :price,
          :flavor,
          :color,
          :hop,
          :craft_beer_type_id,
        )
      end

      def craft_beers_as_json(craft_beers)
        craft_beers.map do |craft_beer|
          craft_beer.as_json.merge(
            image_url: craft_beer_image_url(craft_beer),
          )
        end
      end

      def craft_beer_image_url(craft_beer)
        url_for(craft_beer&.craft_beer_image) if craft_beer.craft_beer_image.attached?
      end
    end
  end
end
