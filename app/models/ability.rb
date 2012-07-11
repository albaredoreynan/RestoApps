class Ability
  include CanCan::Ability

  def initialize(client_user)
    client_user ||= ClientUser.new
    role_name = client_user.role
    
    case role_name
    
    when 'branch'  
      branch = client_user.branch
      
      can :read, Client
      cannot [:create, :edit, :update, :destroy], Client
      
      can :read, ClientUser, :branch_id => branch.id 
      cannot [:create, :edit, :update, :destroy], ClientUser, :branch_id => branch.id
      
      can :read, Branch
      cannot [:create, :edit, :update, :destroy], Branch, :branch_id => branch.id
      
      can :read, Concept
      cannot [:create, :edit, :update, :destroy], Concept
      
      can :read, SaleCategory
      cannot [:create, :edit, :update, :destroy], SaleCategory
      
      can :read, SettlementType
      cannot [:create, :edit, :update, :destroy], SettlementType
      
      can :read, Category
      cannot [:create, :edit, :update, :destroy], Category
      
      can :read, Subcategory
      cannot [:create, :edit, :update, :destroy], Subcategory
      
      can :read, Item
      cannot [:create, :edit, :update, :destroy], Item
      
    when 'client'
      
      can :read, Client
      cannot [:new, :create, :edit, :delete], Client      
      
      can :manage, ClientUser
      can [:new, :create], ClientUser
      
      can :manage, Branch
      can [:new, :create], Branch
      
      can :manage, Concept
      can [:new, :create], Concept
      
    when 'accounting'
      
      can :read, :all
      
    when 'admin'
      
      can :manage, :all
      
    end
  end
end
