class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if current_user
      json_response(resource)
    else
      json_response({ message: "Sorry, you must be logged in to do this." }, :unauthorized)
    end
  end

  def respond_to_on_destroy
    if current_user
      log_out_success
    else 
      log_out_failure
    end
  end

  def log_out_success
    json_response({ message: "Logged out sucessfully." })
  end

  def log_out_failure
    json_response({ message: "Something went wrong." }, :bad_request)
  end
end