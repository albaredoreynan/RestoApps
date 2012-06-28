class SaleCategory < ActiveRecord::Base
  attr_accessible :name, :branch_id, :concept_id, :client_id
  
  has_many :sale_sale_categories
  has_many :sales, :through => :sale_sale_categories
  
end
