class InvoicesController < ApplicationController
  def index
    render html: "<h1>Invoices Index - Route Works!</h1>".html_safe
  end
  
  def new
    render html: "<h1>New Invoice - Route Works!</h1>".html_safe
  end
end
