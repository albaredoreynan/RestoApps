
class Account::SalesModule::SalesController < Account::SalesModuleController
  set_tab :sales
  
  def index
    @sales = Sale.order("updated_at")
    @sales_grid = initialize_grid(Sale)
  end
  
  def show
    @sale = Sale.find(params[:id])
  end
  
  def new
    @sale = Sale.new
  end
  
  def edit
    @sale = Sale.find(params[:id])
  end
  
  def create
    @sale = Sale.new(params[:sale])
    
    if @sale.save
      @sale.client_id = @sale.concept.client.id
      @sale.save
      flash[:success] = "Sale has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @sale = Sale.find(params[:id])

    if @sale.update_attributes(params[:sale])
      flash[:success] = "Sale was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    
    flash[:success] = "Sale was successfully deleted"
    redirect_to :action => :index
  end
end
