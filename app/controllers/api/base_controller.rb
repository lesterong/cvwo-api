class Api::BaseController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do
    json_response({ message: 'Not found'}, :not_found)
  end
end