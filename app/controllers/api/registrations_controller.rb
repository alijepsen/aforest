class Api::RegistrationsController < Devise::RegistrationsController
  #react router doesn't refresh page - and u get new one each refresh
  skip_before_action :verify_authenticity_token
  clear_respond_to
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(
      :first_name, :last_name, :role,
      :email, :verify_email, :password, :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
      :first_name, :last_name, :role,
      :email, :verify_email, :password, :password_confirmation, :current_password
    )
  end

# update a user without updating the password - devise override - could
# be in a user controller but we don't have one
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
