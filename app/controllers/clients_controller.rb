class ClientsController < ApplicationController
  def index
    render html: "<h1>Clients Index = Route Wroks!</h1>".html_safe
  end
end
