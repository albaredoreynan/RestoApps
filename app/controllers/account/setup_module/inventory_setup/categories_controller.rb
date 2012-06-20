
class Account::SetupModule::InventorySetup::CategoriesController < Account::SetupModule::InventorySetupController
  def index
    @categories = Category.order("updated_at")
    @categories_grid = initialize_grid(Category)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:success] = "Category has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:success] = "Category was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    flash[:success] = "Category was successfully deleted"
    redirect_to :action => :index
  end
end
