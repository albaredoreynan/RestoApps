class Account::ReportsModuleController < AccountController
  def index
    redirect_to account_sales_module_sales_path
  end
end
