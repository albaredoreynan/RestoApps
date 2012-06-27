class SaleSettlementType < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sale, :settlement_type
end
