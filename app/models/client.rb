class Client < ActiveRecord::Base
  has_many :concepts, :dependent => :destroy
  
  attr_accessible :name, :address, :contact_number
  
end
