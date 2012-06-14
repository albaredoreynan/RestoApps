class Subcategory < ActiveRecord::Base
  attr_accessible :name, :category_id, :branch_id, :concept_id, :client_id
  
  belongs_to :category
  has_many :items, :dependent => :destroy
end