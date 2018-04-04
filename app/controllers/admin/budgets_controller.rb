#
class Admin::BudgetsController < Admin::BaseController
  def index
    @budgets = Budget.all
  end
end
