class BlogsController < ApplicationController
  load_and_authorize_resource
  
  def publish
    @blog=Blog.find(params[:id])
    @blog.published=true
    @blog.published_on=Time.now
    @blog.save
    redirect_to :back
  end
 
  def index

   @blogs=Blog.all

  end

 
  def show
    if params[:id]
   @blog=Blog.find(params[:id]) 
   else
      @blog=Blog.where('published = ?', true).last
   end
    #@blogs=Blog.find(:all, :order => "published_on  DESC" )
    @blogs=Blog.where('published = ?', true).order("published_on  DESC" )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @blog }
    end
  end
 
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

 
  def create
    @blog = Blog.new(params[:blog])
    
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, :notice => 'Blog was successfully created.' }
        format.json { render :json => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, :notice => 'Blog was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :ok }
    end
  end
end
