module Api
  module V1
    class BreweriesController < Api::BaseController
      skip_before_action :authenticate_user!

      def index
        @breweries = Brewery.all.with_attached_logo

        render json: breweries_as_json(@breweries)
      end

      private

      def logo_url(brewery)
        url_for(brewery&.logo) if brewery.logo.attached?
      end

      def breweries_as_json(breweries)
        breweries.map do |brewery|
          address = brewery.address
          logo = logo_url(brewery)
          attributes = brewery.attributes
          attributes.delete("address_data")

          attributes.as_json.merge(
            logo: logo,
            address: address,
          )
        end
      end
    end
  end
end
