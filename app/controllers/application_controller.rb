class ApplicationController < ActionController::Base
  # TODO investigate details of this
  protect_from_forgery with: :null_session
end
