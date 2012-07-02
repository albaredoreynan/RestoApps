
class Account::InventoryModule::EndcountsController < Account::InventoryModuleController
  set_tab :endcounts
  
  def index
    @endcounts = Endcount.all(:conditions => ["group != ?", "non-inventory"]).order("updated_at")
    @endcounts_grid = initialize_grid(Endcount)
  end
  
  def show
    @endcount = Endcount.find(params[:id])
  end
  
  def new
    @endcount = Endcount.new
    items = Item.order("subcategory_id, name ASC")
    items.each do |item|
      @endcount.item_counts.build({ :item_id => item.id })
    end
  end
  
  def edit
    @endcount = Endcount.find(params[:id])
  end
  
  def create
    @endcount = Endcount.new(params[:endcount])
    
    if @endcount.save
      flash[:success] = "Endcount has been created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def update
    @endcount = Endcount.find(params[:id])

    if @endcount.update_attributes(params[:endcount])
      flash[:success] = "Endcount was successfully updated"
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end
  
  def destroy
    @endcount = Endcount.find(params[:id])
    @endcount.destroy
    
    flash[:success] = "Endcount was successfully deleted"
    redirect_to :action => :index
  end
end
