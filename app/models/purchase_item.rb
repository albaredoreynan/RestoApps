class PurchaseItem < ActiveRecord::Base
  attr_accessible :item_id, :purchase_id
  
  belongs_to :item
  belongs_to :purchase
end
