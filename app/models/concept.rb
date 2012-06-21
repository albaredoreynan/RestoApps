class Concept < ActiveRecord::Base
  belongs_to :client, :class_name => "Client"
  has_many :branches, :dependent => :destroy
  
  has_many :categories, :dependent => :destroy
  
  attr_accessible :name, :client_id
end
