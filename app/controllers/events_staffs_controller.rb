class EventsStaffsController < ApplicationController
  layout false, only: [:check_staff]
  skip_before_action :sessions
  before_action :check_event_id, except: [:create, :update]
  before_action :set_events_staff, only: [:show, :edit, :update, :destroy]

  #avoiding repetition of fetching staff relating to an event.
  before_action :index, only: [:check_staff]

  # GET /events_staffs
  # GET /events_staffs.json
  def index
  	#filter the results to the ones relating to the event_id
    @events_staffs = EventsStaff.where("event_id = ?", session[:event_id])
  end

  def check_staff
    if params[:qrcode] then
    	qrcode = params[:qrcode]
    	qrcode = qrcode.gsub! "\r", ""
	    qrcode = RQRCode::QRCode.new(qrcode)
    	svg = qrcode.as_svg(module_size: 3)
		@events_staffs.each do |event_staff|
			if event_staff.staff_qr_code == svg then
				if event_staff.update({:checkedin => true}) then
					@staff = "#{event_staff.staff.staff_first_name} #{event_staff.staff.staff_last_name} has checked in"
				end
	    	end
    	end
    end
  end

  # GET /events_staffs/1
  # GET /events_staffs/1.json
  def show
  end

  # GET /events_staffs/new
  def new
    @events_staff = EventsStaff.new({:event_id => session[:event_id]})
  end

  # GET /events_staffs/1/edit
  def edit
  end

  # POST /events_staffs
  # POST /events_staffs.json
  def create
    @events_staff = EventsStaff.new(events_staff_params)
    info="Event: #{@events_staff.event.event_name}\n"
    info+="Event Staff ID: #{@events_staff.event.id}#{@events_staff.staff.id}\n"
    info+="First Name: #{@events_staff.staff.staff_first_name}\n" 
    info+="Last Name: #{@events_staff.staff.staff_last_name} \n" 
    info+="Email: #{@events_staff.staff.staff_email} \n"
    info+="Telephone: #{@events_staff.staff.staff_telephone} \n"
    info+="Company: #{@events_staff.staff.organization.organization_name}"
    qrcode = RQRCode::QRCode.new(info)
    @events_staff.staff_qr_code = qrcode.as_svg(module_size: 3)
    #svg = qrcode.as_svg
    #image = qrcode.as_png
    respond_to do |format|
      if @events_staff.save
        #format.html { redirect_to @events_staff, notice: 'Events staff was successfully created.' }
        #format.json { render :show, status: :created, location: @events_staff }
        format.js
      else
        #format.html { render :new }
        #format.json { render json: @events_staff.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /events_staffs/1
  # PATCH/PUT /events_staffs/1.json
  def update
    respond_to do |format|
      if @events_staff.update(events_staff_params)
        format.html { redirect_to @events_staff, notice: 'Events staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @events_staff }
      else
        format.html { render :edit }
        format.json { render json: @events_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_staffs/1
  # DELETE /events_staffs/1.json
  def destroy
    @events_staff.destroy
    respond_to do |format|
      format.html { redirect_to events_staffs_url, notice: 'Events staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
	#Check event_id (as the name implies) makes sure that every action in events_staff are of a particular event
    def check_event_id
		if params[:event_id] then
		  session[:event_id] = params[:event_id]
		end

	  	redirect_to :controller=>'events' if session[:event_id] == nil
	end

    # Use callbacks to share common setup or constraints between actions.
    def set_events_staff
  		@events_staff = EventsStaff.find(params[:id])
  		#if @events_staff.event_id != session[:event_id] then
  		#	redirect_to :controller => 'events'
		#end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def events_staff_params
      params.require(:events_staff).permit(:event_id, :staff_id, :staff_qr_code)
    end

end
