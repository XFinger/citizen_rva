class OrdersController < ApplicationController
  after_filter :get_ttls, :only => [:create, :update]
  before_filter :authenticate_user!
  
  
  def order_sheet
    @order=Order.find(params[:id])
    @address =  "#{@order.address.street}  #{@order.address.city}, #{@order.address.state}"
    
    #@json = @address.to_gmaps4rails 
    @citizen_address='909 E. Main St Richmond VA, 23219'
    @citizen = GeoKit::Geocoders::MultiGeocoder.geocode(@citizen_address)
    
    
  end
  
  def get_geo
    address =  "#{@order.address.street}  #{@order.address.city}, #{@order.address.state}"
    res=GeoKit::Geocoders::MultiGeocoder.geocode(address)
    @order.address.lat = res.lat
    @order.address.lng = res.lng
  end  
  
  
  
  def get_ttls
    #@order=Order.find(params[:id])
    @tax_rate = 0.11
    @sands_ttl=0
    @salads_ttl=0
    @sides_ttl=0
    @drinks_ttl=0
    @order_sub=0
    @order_tax=0
    @order_ttl=0
    
    @order.dishes.each do |d|
      unless d.count.blank?
        @sand=d.count * d.price
        @sands_ttl = @sands_ttl + @sand
      end
    end  
    
    @order.salads.each do |sal|
      unless sal.sal_count.blank?
      @salad=sal.sal_count * sal.sal_price
      @salads_ttl = @salads_ttl + @salad
      end
    end
    
    @order.sides.each do |side|
      unless side.s_count.blank?
      @side= side.s_count * side.s_price
      @sides_ttl = @sides_ttl + @side
      end
    end
    
    @order.drinks.each do |dr|
      unless dr.d_count.blank?
      @drink=dr.d_count * dr.d_price
      @drinks_ttl = @drinks_ttl + @drink
      end
    end
    
    @order_sub=@sands_ttl + @salads_ttl + @sides_ttl + @drinks_ttl
    @order_tax= @order_sub * @tax_rate
    @order_ttl=@order_sub + @order_tax
    
    @order.sub_ttl=@order_sub
    @order.tax=@order_tax
    @order.ttl_price=@order_ttl
    @order.save
  end
  
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
  
    end
  end

  def confirmation
    @order=Order.find(params[:id])
    @order.confirmed = true
    @order.save
    @user=current_user
    @address=Address.find(params[:address])
    ConfirmationMailer.order_confirmation(@user, @address, @order).deliver
  end
  
  def show
    @order = Order.find(params[:id])
    
    @user= current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

 
  def new
    @boxmenu = Boxmenu.find(:first)
    @user=current_user
    #@address=Address.find(:first, :conditions => ['user_id = ?', current_user.id])
    @order = Order.new
 
    
   
    @order.build_address( :city => "Richmond", :state => "VA")
 
 
    @boxmenu.dishes.each do |dish|
      @order.dishes.build(:name => dish.name, :description =>dish.description, :price => dish.price)
    end
      @boxmenu.salads.each do |salad|
      @order.salads.build(:sal_name => salad.sal_name, :sal_description => salad.sal_description, :sal_price => salad.sal_price)
    end
    @boxmenu.sides.each do |side|
      @order.sides.build(:s_name => side.s_name, :s_price => side.s_price)
    end
    @boxmenu.drinks.each do |drink|
      @order.drinks.build(:d_name => drink.d_name, :d_price => drink.d_price)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

 
  def edit
    @boxmenu = Boxmenu.find(:first)
    @order = Order.find(params[:id])

  end

 
  def create
    @order = Order.new(params[:order])
    get_geo
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, :notice => 'Order was successfully created.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @order = Order.find(params[:id])
    get_geo
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
