class GalleriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @galleries = Gallery.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @galleries }
    end
  end
 
  def show
    @gallery = Gallery.first
    @photos = Photo.order('created_at desc').page(params[:page]).per(15)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gallery }
    end
  end

 
  def new
    @gallery = Gallery.new
    @gallery.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gallery }
    end
  end

 
  def edit
    @gallery = Gallery.find(params[:id])
  end

 
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, :notice => 'Gallery was successfully created.' }
        format.json { render :json => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, :notice => 'Gallery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :ok }
    end
  end
end
