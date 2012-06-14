class Category < ActiveRecord::Base
  attr_accessible :name, :branch_id, :concept_id, :client_id
  
  has_many :subcategories, :dependent => :destroy
  belongs_to :concept
end
