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
        if Rails.env.production?
          "http://microbrewers.beer#{rails_blob_path(brewery&.logo)}" if brewery.logo.attached?
        elsif brewery.logo.attached?
          url_for(brewery&.logo)
        end
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
