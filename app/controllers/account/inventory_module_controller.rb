
class Account::InventoryModuleController < AccountController
  def index
    redirect_to new_account_inventory_module_item_count_path
  end
end