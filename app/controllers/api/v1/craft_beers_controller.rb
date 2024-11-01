module Api
  module V1
    class CraftBeersController < Api::BaseController
      skip_before_action :authenticate_user!, only: [:index]

      def index
        @craft_beers = if params[:user_id]
          CraftBeer.where(brewery_id: params[:user_id]).with_attached_craft_beer_image
        else
          CraftBeer.all.with_attached_craft_beer_image
        end

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
          :color,
          :brewery_id,
          :craft_beer_type_id,
          flavors: [],
          hops: [],
        )
      end

      def craft_beers_as_json(craft_beers)
        craft_beers.map do |craft_beer|
          craft_beer.as_json.merge(
            craft_beer_image: craft_beer_image_url(craft_beer),
          )
        end
      end

      def craft_beer_image_url(craft_beer)
        url_for(craft_beer&.craft_beer_image) if craft_beer.craft_beer_image.attached?
      end
    end
  end
end
