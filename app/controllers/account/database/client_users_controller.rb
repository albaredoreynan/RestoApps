
class Account::Database::ClientUsersController < AccountController
  def index
    @client_users = ClientUser.order("created_at")
    @client_users_grid = initialize_grid(ClientUser, :include => [:branch, :concept, :client])
  end
end
