
class Account::SetupModule::OrganizationSetup::ClientsController < Account::SetupModule::OrganizationSetupController
  
  def index
    @clients = Client.order("updated_at")
    @clients_grid = initialize_grid(Client)
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def create
    @client = Client.new(params[:client])
    
    if @client.save
      flash[:success] = "Company has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(params[:client])
      flash[:success] = "Company was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    
    flash[:success] = "Client was successfully deleted"
    redirect_to :action => :index
  end
  
end
