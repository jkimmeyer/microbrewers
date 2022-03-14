module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :account_type,
        { account_attributes: %i[name street house_number postal_code city country description ust_id] },
      ])
    end
  end
end
