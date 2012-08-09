class SidesController < ApplicationController
#  # GET /sides
#  # GET /sides.json
#  def index
#    @sides = Side.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render :json => @sides }
#    end
#  end
#
#  # GET /sides/1
#  # GET /sides/1.json
#  def show
#    @side = Side.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render :json => @side }
#    end
#  end
#
#  # GET /sides/new
#  # GET /sides/new.json
#  def new
#    @side = Side.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render :json => @side }
#    end
#  end
#
#  # GET /sides/1/edit
#  def edit
#    @side = Side.find(params[:id])
#  end
#
#  # POST /sides
#  # POST /sides.json
#  def create
#    @side = Side.new(params[:side])
#
#    respond_to do |format|
#      if @side.save
#        format.html { redirect_to @side, :notice => 'Side was successfully created.' }
#        format.json { render :json => @side, :status => :created, :location => @side }
#      else
#        format.html { render :action => "new" }
#        format.json { render :json => @side.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # PUT /sides/1
#  # PUT /sides/1.json
#  def update
#    @side = Side.find(params[:id])
#
#    respond_to do |format|
#      if @side.update_attributes(params[:side])
#        format.html { redirect_to @side, :notice => 'Side was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.json { render :json => @side.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /sides/1
#  # DELETE /sides/1.json
#  def destroy
#    @side = Side.find(params[:id])
#    @side.destroy
#
#    respond_to do |format|
#      format.html { redirect_to sides_url }
#      format.json { head :ok }
#    end
#  end
end
