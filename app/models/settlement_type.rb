class SettlementType < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sale_settlement_types
  has_many :sales, :through => :sale_settlement_types
end
