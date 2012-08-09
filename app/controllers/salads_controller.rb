class SaladsController < ApplicationController
#  # GET /salads
#  # GET /salads.json
#  def index
#    @salads = Salad.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render :json => @salads }
#    end
#  end
#
#  # GET /salads/1
#  # GET /salads/1.json
#  def show
#    @salad = Salad.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render :json => @salad }
#    end
#  end
#
#  # GET /salads/new
#  # GET /salads/new.json
#  def new
#    @salad = Salad.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render :json => @salad }
#    end
#  end
#
#  # GET /salads/1/edit
#  def edit
#    @salad = Salad.find(params[:id])
#  end
#
#  # POST /salads
#  # POST /salads.json
#  def create
#    @salad = Salad.new(params[:salad])
#
#    respond_to do |format|
#      if @salad.save
#        format.html { redirect_to @salad, :notice => 'Salad was successfully created.' }
#        format.json { render :json => @salad, :status => :created, :location => @salad }
#      else
#        format.html { render :action => "new" }
#        format.json { render :json => @salad.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # PUT /salads/1
#  # PUT /salads/1.json
#  def update
#    @salad = Salad.find(params[:id])
#
#    respond_to do |format|
#      if @salad.update_attributes(params[:salad])
#        format.html { redirect_to @salad, :notice => 'Salad was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.json { render :json => @salad.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /salads/1
#  # DELETE /salads/1.json
#  def destroy
#    @salad = Salad.find(params[:id])
#    @salad.destroy
#
#    respond_to do |format|
#      format.html { redirect_to salads_url }
#      format.json { head :ok }
#    end
#  end
end
