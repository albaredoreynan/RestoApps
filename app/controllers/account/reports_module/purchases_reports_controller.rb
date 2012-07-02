class Account::ReportsModule::PurchasesReportsController < Account::ReportsModuleController
  set_tab :purchases_reports
  
  def index
    @purchase_items = PurchaseItem.order("updated_at")
    @purchase_items_grid = initialize_grid(PurchaseItem, :include => [:purchase, :item])
  end
  
  def show
    @purchase_item = PurchaseItem.find(params[:id])
  end
  
  def new
    @purchase_item = PurchaseItem.new
  end
  
  def edit
    @purchase_item = PurchaseItem.find(params[:id])
  end
  
  def create
    @purchase_item = PurchaseItem.new(params[:purchase_item])
    
    if @purchase_item.save
      flash[:success] = "Purchase item has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @purchase_item = PurchaseItem.find(params[:id])

    if @purchase_item.update_attributes(params[:purchase_item])
      flash[:success] = "Purchase item was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @purchase_item = PurchaseItem.find(params[:id])
    @purchase_item.destroy
    
    flash[:success] = "Purchase item was successfully deleted"
    redirect_to :action => :index
  end
end
