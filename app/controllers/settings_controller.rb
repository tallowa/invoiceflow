class SettingsController < ApplicationController
  def show
    render html: "<h1>Settings - Route Works!</h1>".html_safe
  end
end
