module Api
  module V1
    class HopsController < Api::BaseController
      skip_before_action :authenticate_user!

      def index
        @hops = Hop.all

        render json: @hops
      end
    end
  end
end
