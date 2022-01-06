class Api::UsersController < Api::BaseController
  before_action :set_user, only: [:show]

  def show
    json_response(@user)
  end

  private

  def set_user
    @user = current_user
  end
end
