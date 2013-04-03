class Admin::PunchclocksController < ApplicationController
  load_and_authorize_resource
  
  after_filter :get_date, :only => [:create]
  
  def get_date
    @date = @punchclock.in.to_date
    get_period(@date)
    @punchclock.paydate=@date
    @punchclock.payperiod=@counter
    @punchclock.save
    
  end
  def is_today
    @user = current_user
    if @user.in?
      @punchclock=@user.punchclocks.last
      if @punchclock.in != Date.today
        @punchclock.toggle!
      end
    end
  end
  
  def get_period(check_date)
   inception_date = Time.parse('2013-01-03')
   @inception_date = inception_date.to_date
   x=false
   @counter=1
   while x==false do
     @range=@inception_date..@inception_date+13.days
     if @range.include? check_date
       x = true
     else
      @counter+=1
      @inception_date=@inception_date + 14.days
     end
    end    
  end
  def index
    @employees=User.with_role :employee
   # @date = params[:per].blank? ? Date.today : Date.parse(params[:per] )
    #get_period(@date)    
    
  end
  def period_hours(in_out)
    @total=0
    in_out.each do |t|
      unless t.in.blank? || t.out.blank?
        @total=@total+(t.out-t.in)
      end
    end
  end
  def clocks
    @employees=User.with_role :employee

    @counter=params[:counter]
    @user=User.find(params[:empl])
    @date = params[:per].blank? ? Date.today : Date.parse(params[:per] )
    get_period(@date)
    @punchclocks = Punchclock.where('user_id =? AND payperiod=?', @user.id, @counter).all
    period_hours(@punchclocks)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punchclocks }
      format.js
    end
  end

 
  def show
    @employees = User.with_role :employee
   # @punchclock = Punchclock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punchclock }
    end
  end

 
  def new
    @user=User.find(params[:empl])
    @punchclock = Punchclock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punchclock }
    end
  end

 
  def edit
    @punchclock=Punchclock.find(params[:id])

 
  end

 
  def create
 
    @punchclock = Punchclock.new(params[:punchclock])
 
    respond_to do |format|
      if @punchclock.save
       # current_user.toggle!
        format.html { redirect_to :action => "clocks", :empl => @punchclock.user_id}
        format.json { render json: @punchclock, status: :created, location: @punchclock }
      else
        format.html { render action: "new" }
        format.json { render json: @punchclock.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @punchclock = Punchclock.find(params[:id])

    respond_to do |format|
      if @punchclock.update_attributes(params[:punchclock])
 
        format.html  { redirect_to :action => "clocks", :empl => @punchclock.user_id}   
        format.json { head :ok }
        #format.js {  render :js => "window.location = '/admin/punchclocks/clocks'", :empl=> @punchclock.user_id, notice: 'You have punched out' }
      else

        format.html { render action: "edit" }
        format.json { render json: @punchclock.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @punchclock = Punchclock.find(params[:id])
    @punchclock.destroy

    respond_to do |format|
      format.html { redirect_to punchclocks_url }
      format.json { head :ok }
    end
  end
end