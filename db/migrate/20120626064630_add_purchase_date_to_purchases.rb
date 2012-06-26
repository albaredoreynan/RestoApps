class AddPurchaseDateToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_date, :timestamp
  end
end
