module Api
  module V1
    class BreweriesController < Api::BaseController
      skip_before_action :authenticate_user!

      def index
        @breweries = Brewery.all

        render json: @breweries
      end
    end
  end
end
