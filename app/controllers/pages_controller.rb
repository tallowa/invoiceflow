class PagesController < ApplicationController
  skip_before_action :authenticate_user! # Allow public access
  layout 'landing', only: [:home, :pricing] # Use landing layout

  def home
    # Landing page - no logic needed unless you want to track visits
    redirect_to dashboard_path if user_signed_in?
  end

  def pricing
    # Pricing page
  end

  def about
    # About page
  end
end
