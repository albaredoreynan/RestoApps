class Item < ActiveRecord::Base
  attr_accessible :name, :subcategory_id, :branch_id, :concept_id, :client_id
  
  belongs_to :subcategory
  belongs_to :unit
  
  has_many :item_counts, :dependent => :destroy
  
  has_many :purchase_items, :dependent => :destroy
  has_many :purchases, :through => :purchase_items
end
