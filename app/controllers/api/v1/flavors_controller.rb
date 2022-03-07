module Api
  module V1
    class FlavorsController < Api::BaseController
      skip_before_action :authenticate_user!

      def index
        @flavors = Flavor.all

        render json: @flavors
      end
    end
  end
end
