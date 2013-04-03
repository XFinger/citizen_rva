class PunchclocksController < ApplicationController
  load_and_authorize_resource
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
    @user=current_user
    @date = params[:per].blank? ? Date.today : Date.parse(params[:per] )

    get_period(@date)
    @punchclocks = @user.punchclocks.where('payperiod=?', @counter)
   # @punchclock=@punchclocks.group_by { |e| e.created_at}
    if @user.in?
      @current_clock=@user.punchclocks.last
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punchclocks }
    end
  end

 
# def show
#   @punchclock = Punchclock.find(params[:id])
#
#   respond_to do |format|
#     format.html # show.html.erb
#     format.json { render json: @punchclock }
#   end
# end
#
#
# def new
#   @user=current_user
#   get_period(Date.today)
#   @punchclock = Punchclock.new
#
#   respond_to do |format|
#     format.html # new.html.erb
#     format.json { render json: @punchclock }
#   end
# end
#
#
# def edit
#   @user=current_user
#   @punchclock = @user.punchclock.find(last)
#   get_period(Date.today)
# end
#
 
  def create

    @punchclock = Punchclock.new(:user_id => current_user.id, :user_name => params[:user_name], :payperiod => params[:payperiod], :in => Time.now, :paydate => Date.today)
 
    respond_to do |format|
      if @punchclock.save
        current_user.toggle!
        format.html { redirect_to :back, notice: 'You are now punched in' }
        format.json { render json: @punchclock, status: :created, location: @punchclock }
      else
        format.html { render action: "new" }
        format.json { render json: @punchclock.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @punchclock = Punchclock.find(params[:id])
    @punchclock.out = Time.now
    respond_to do |format|
      if @punchclock.update_attributes(params[:punchclock])
        current_user.toggle!
        format.html { redirect_to :back, notice: 'You have punched out' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @punchclock.errors, status: :unprocessable_entity }
      end
    end
  end

 
# def destroy
#   @punchclock = Punchclock.find(params[:id])
#   @punchclock.destroy
#
#   respond_to do |format|
#     format.html { redirect_to punchclocks_url }
#     format.json { head :ok }
#   end
# end
end
