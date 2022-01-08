class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  rescue_from ActiveRecord::RecordNotUnique do |e|
    json_response({ message: "There is already an account with this email. Please login instead." }, :conflict)
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      register_success
    else
      register_failed
    end
  end

  def register_success
    json_response({ message: "Signed up sucessfully." }, :ok)
  end

  def register_failed
    json_response({ message: "Something went wrong." }, :bad_request)
  end

end