module Api
  class BaseController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_user!
    protect_from_forgery with: :null_session
  end
end
