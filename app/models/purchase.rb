class Purchase < ActiveRecord::Base
  attr_accessible :supplier_id, :branch_id, :concept_id, :client_id, :creator_id
  
  belongs_to :supplier
  belongs_to :branch
  belongs_to :concept
  belongs_to :client
  belongs_to :client_user
  
  has_many :purchase_items, :dependent => :destroy
  has_many :items, :through => :purchase_items
end
