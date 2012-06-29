class Sale < ActiveRecord::Base
  
  attr_accessible :branch_id, :sale_date_time, :sale_sale_categories_attributes, :vat, :service_charge, 
                  :sale_settlement_types_attributes, :cash_in_drawer, :gc_redeemed, :delivery_sales, 
                  :customer_count, :transaction_count, :delivery_transaction_count, :credit_card_transaction_count, :gc_sales, 
                  :other_income, :sale_settlement_id, :sale_sale_category_id
  
  has_many :sale_sale_categories
  has_many :sale_categories, :through => :sale_sale_categories
  
  has_many :sale_settlement_types
  has_many :settlement_types, :through => :sale_settlement_types
  
  has_many :sale_servers
  has_many :servers, :through => :sale_servers
  
  accepts_nested_attributes_for :sale_sale_categories
  accepts_nested_attributes_for :sale_settlement_types
  
end
