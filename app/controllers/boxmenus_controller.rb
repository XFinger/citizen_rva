class BoxmenusController < ApplicationController
  
  load_and_authorize_resource
  
  def index
    @boxmenus = Boxmenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @boxmenus }
    end
  end

  # GET /boxmenus/1
  # GET /boxmenus/1.json
  def show
    @boxmenu = Boxmenu.find(:last)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @boxmenu }
    end
  end

  # GET /boxmenus/new
  # GET /boxmenus/new.json
  def new
    @boxmenu = Boxmenu.new
    salad=@boxmenu.salads.build
    dish=@boxmenu.dishes.build
    side=@boxmenu.sides.build
    drink=@boxmenu.drinks.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @boxmenu }
    end
  end

  # GET /boxmenus/1/edit
  def edit
    @boxmenu = Boxmenu.find(params[:id])
  end

  # POST /boxmenus
  # POST /boxmenus.json
  def create
    @boxmenu = Boxmenu.new(params[:boxmenu])

    respond_to do |format|
      if @boxmenu.save
        format.html { redirect_to @boxmenu, :notice => 'Boxmenu was successfully created.' }
        format.json { render :json => @boxmenu, :status => :created, :location => @boxmenu }
      else
        format.html { render :action => "new" }
        format.json { render :json => @boxmenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boxmenus/1
  # PUT /boxmenus/1.json
  def update
    @boxmenu = Boxmenu.find(params[:id])

    respond_to do |format|
      if @boxmenu.update_attributes(params[:boxmenu])
        format.html { redirect_to @boxmenu, :notice => 'Boxmenu was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @boxmenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boxmenus/1
  # DELETE /boxmenus/1.json
  def destroy
    @boxmenu = Boxmenu.find(params[:id])
    @boxmenu.destroy

    respond_to do |format|
      format.html { redirect_to boxmenus_url }
      format.json { head :ok }
    end
  end
end
