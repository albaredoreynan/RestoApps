class SaleCategory < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sale_sale_categories
  has_many :sales, :through => :sale_sale_categories
end
