class Client < ActiveRecord::Base
  has_many :concepts, :dependent => :destroy
  
  attr_accessible :name
  
end
