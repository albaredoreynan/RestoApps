class Server < ActiveRecord::Base
  belongs_to :concept
  # attr_accessible :title, :body
  has_many :sale_servers
  has_many :sales, :through => :sale_servers
end
