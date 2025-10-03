class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  # Add flash types
  add_flash_types :info, :error, :warning, :success

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :timezone, :currency])
  end

  def check_subscription
    unless current_user.active_subscription?
      redirect_to pricing_path, alert: "Please upgrade your account to continue."
    end
  end

  def check_invoice_limit
    unless current_user.can_create_invoice?
      redirect_to invoices_path, alert: "You've reached your monthly invoice limit. Please upgrade to continue."
    end
  end

  def check_client_limit
    unless current_user.can_add_client?
      redirect_to clients_path, alert: "You've reached your client limit. Please upgrade to add more clients."
    end
  end
end
