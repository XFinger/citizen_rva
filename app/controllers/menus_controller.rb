class MenusController < ApplicationController
  load_and_authorize_resource 
  
  def get_menu
    @menu=Menu.first
    send_file "#{Rails.root}/public#{@menu.pdf_url}"
  end

  def show
    @menu = Menu.find(:last)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @menu }
      
    end
  end
 
  def new
    @menu = Menu.new
    @menu.salads.build
    @menu.dishes.build
    @menu.sides.build
    @menu.breakfasts.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @menu }
    end
  end

 
  def edit
    @menu = Menu.find(params[:id])
  end
 
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, :notice => 'Menu was successfully created.' }
        format.json { render :json => @menu, :status => :created, :location => @menu }
      else
        format.html { render :action => "new" }
        format.json { render :json => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @menu, :notice => 'Menu was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :ok }
    end
  end
end
