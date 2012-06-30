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
  
  belongs_to :branch, :class_name => 'Branch'
  
  def category_total
    sale_sale_categories.map(&:amount).reject(&:nil?).inject(:+).to_f || 0
  end

  def settlement_type_total
    sale_settlement_types.map(&:amount).reject(&:nil?).inject(:+) || 0
  end

  def server_sale_total
    sale_servers.map(&:amount).reject(&:nil?).inject(:+) || 0
  end

  def net_sales
    category_total
  end

  def total_revenues
    category_total + vat + service_charge
  end

  def total_settlement_type_sales
    #settlement_type_total + gc_redeemed + delivery_sales 
    settlement_type_total + gc_redeemed + delivery_sales + cash_in_drawer 
  end

  def cash_for_deposit
    cash_in_drawer + gc_sales + other_income
    #gc_sales + other_income
  end

  def per_person_ave
    (net_sales / customer_count).round(2) unless customer_count == 0
  end

  def per_trans_ave
    (net_sales / transaction_count).round(2) unless transaction_count == 0
  end
  
end
