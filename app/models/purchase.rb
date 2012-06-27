class Purchase < ActiveRecord::Base
  attr_accessible :supplier_id, :branch_id, :concept_id, :client_id, :creator_id
  
  attr_accessible :purchase_date, :invoice_number
  
  belongs_to :supplier
  belongs_to :branch
  belongs_to :concept
  belongs_to :client
  belongs_to :client_user
  
  has_many :purchase_items, :dependent => :destroy
  has_many :items, :through => :purchase_items
  
  accepts_nested_attributes_for :purchase_items, :allow_destroy => :true
end
