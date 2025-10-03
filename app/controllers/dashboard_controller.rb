class DashboardController < ApplicationController
  def show
    @stats = calculate_stats
    @recent_invoices = current_user.invoices.recent.limit(5)
    @overdue_invoices = current_user.invoices.overdue_invoices.limit(5)
    @recent_payments = Payment.joins(:invoice)
                              .where(invoices: { user_id: current_user.id })
                              .recent
                              .limit(5)
  end

  private

  def calculate_stats
    invoices = current_user.invoices
    
    {
      total_outstanding: invoices.unpaid.sum(:total),
      total_overdue: invoices.overdue_invoices.sum(:total),
      revenue_this_month: invoices.this_month.sum(:total),
      revenue_last_month: invoices.last_month.sum(:total),
      invoices_this_month: invoices.this_month.count,
      paid_this_month: invoices.this_month.paid_invoices.count,
      total_clients: current_user.clients.active.count,
      total_invoices: invoices.count
    }
  end
end
