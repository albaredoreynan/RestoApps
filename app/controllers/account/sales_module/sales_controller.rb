
class Account::SalesModule::SalesController < Account::SalesModuleController
  set_tab :sales
  
  def index
    @sales = Sale.order("updated_at")
    @sales_grid = initialize_grid(Sale, :include => :branch)
  end
  
  def show
    @sale = Sale.find(params[:id])
  end
  
  def new
    @sale = Sale.new
    categories = SaleCategory.order("updated_at")
    categories.each do |c|
      @sale.sale_sale_categories.build({:sale_category_id => c.id})
    end
    
    settlement_types = SettlementType.order("updated_at")
    settlement_types.each do |st|
      @sale.sale_settlement_types.build({:settlement_type_id => st.id})
    end
    
  end
  
  def edit
    @sale = Sale.find(params[:id])
  end
  
  def create
    @sale = Sale.new(params[:sale])
    
    if @sale.save
      flash[:success] = "Sale has been created"
      redirect_to :action => :new
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
