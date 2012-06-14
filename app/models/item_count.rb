class ItemCount < ActiveRecord::Base
  attr_accessible :item_id, :unit_id, :branch_id, :concept_id, :client_id
  
  belongs_to :item
end
