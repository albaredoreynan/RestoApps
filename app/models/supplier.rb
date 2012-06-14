class Supplier < ActiveRecord::Base
  attr_accessible :name, :branch_id, :concept_id, :client_id
  
  belongs_to :branch
end
