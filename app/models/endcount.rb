class Endcount < ActiveRecord::Base
  attr_accessible :entry_date_time, :branch_id
  
  has_many :item_counts
  has_many :items, :through => :item_counts
  
  accepts_nested_attributes_for :item_counts
end
