class ApplicationController < ActionController::Base
  def index
    # rubocop:disable Rails/RenderInline
    render inline: "", layout: "application"
    # rubocop:enable Rails/RenderInline
  end
end
