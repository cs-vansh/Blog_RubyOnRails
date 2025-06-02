class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # As all controllers inherit from ApplicationController, it makes sure that the pagy methods are available in all controllers.
  include Pagy::Backend
end
