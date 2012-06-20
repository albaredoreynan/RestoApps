
class Account::SetupModule::OrganizationSetup::ClientUsersController < Account::SetupModule::OrganizationSetupController
  def index
    @client_users = ClientUser.order("created_at")
    @client_users_grid = initialize_grid(ClientUser, :include => [:branch, :concept, :client])
  end
end
