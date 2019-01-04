module Frontend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Shared::Controller::Layout
  end
end
