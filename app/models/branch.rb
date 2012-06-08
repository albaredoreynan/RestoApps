class Branch < ActiveRecord::Base
  belongs_to :concept
  belongs_to :client
  has_many :roles, :dependent => :destroy
  
  attr_accessible :name, :concept_id, :client_id
end
