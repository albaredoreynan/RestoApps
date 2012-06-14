class Unit < ActiveRecord::Base
  attr_accessible :name, :branch_id, :concept_id, :client_id
  
  has_many :items, :dependent => :destroy
  has_many :conversions, :dependent => :destroy
end
