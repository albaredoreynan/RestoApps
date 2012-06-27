class Server < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sale_servers
  has_many :sales, :through => :sale_servers
end
