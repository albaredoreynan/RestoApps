class SettlementType < ActiveRecord::Base
  attr_accessible :name, :concept_id, :is_complimentary
  
  has_many :sale_settlement_types
  has_many :sales, :through => :sale_settlement_types
end
