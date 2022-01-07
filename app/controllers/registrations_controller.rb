class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: "Signed up sucessfully." }
  end

  def register_failed
    json_response({ message: "Something went wrong." }, :bad_request)
  end

end