module Api
  module V1
    module DeviseTokenAuth
      class SessionsController < ::DeviseTokenAuth::SessionsController
        # Prevent session parameter from being passed
        # Unpermitted parameter: session
        wrap_parameters false
      end
    end
  end
end
