# class SessionsController < Devise::SessionsController
#   respond_to :json

#   private

#   def respond_with(resource, _opts = {})
#     if current_user
#       render json: { message: 'You are logged in.' }, status: :ok
#     else
#       render json: { message: 'Sorry, you must be logged in to do this.'}, status: :unauthorized
#     end
#   end

#   def respond_to_on_destroy
#     log_out_success && return if current_user

#     log_out_failure
#   end

#   def log_out_success
#     render json: { message: "You are logged out." }, status: :ok
#   end

#   def log_out_failure
#     render json: { message: "Hmm nothing happened."}, status: :unauthorized
#   end
# end

class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    json_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end

end