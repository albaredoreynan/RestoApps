
class Account::SetupModule::OrganizationSetup::BranchesController < Account::SetupModule::OrganizationSetupController
  def index
    @branches = Branch.order("updated_at")
    @branches_grid = initialize_grid(Branch)
  end
  
  def show
    @branch = Branch.find(params[:id])
  end
  
  def new
    @branch = Branch.new
  end
  
  def edit
    @branch = Branch.find(params[:id])
  end
  
  def create
    @branch = Branch.new(params[:branch])
    
    if @branch.save
      flash[:success] = "Branch has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @branch = Branch.find(params[:id])

    if @branch.update_attributes(params[:branch])
      flash[:success] = "Branch was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    
    flash[:success] = "Branch was successfully deleted"
    redirect_to :action => :index
  end
end
