class Sale < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sale_sale_categories
  has_many :sale_categories, :through => :sale_sale_categories
  
  has_many :sale_settlement_types
  has_many :settlement_types, :through => :sale_settlement_types
  
  has_many :sale_servers
  has_many :servers, :through => :sale_servers
end
