class Conversion < ActiveRecord::Base
  attr_accessible :bigger_unit_id, :smaller_unit_id
  
  belongs_to :unit
end
