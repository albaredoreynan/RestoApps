class ClientUser < ActiveRecord::Base
  belongs_to :branch
  belongs_to :concept  
  belongs_to :client
  belongs_to :role
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :branch_id, :concept_id, :client_id, :role_id
  # attr_accessible :title, :body
end
