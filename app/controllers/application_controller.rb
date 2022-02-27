class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    # rubocop:disable Rails/RenderInline
    render inline: "", layout: "application"
    # rubocop:enable Rails/RenderInline
  end
end
