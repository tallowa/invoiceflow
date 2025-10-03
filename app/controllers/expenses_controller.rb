class ExpensesController < ApplicationController
  def index
    render html: "<h1>Expenses Index - Route Works!</h1>".html_safe
  end
end
