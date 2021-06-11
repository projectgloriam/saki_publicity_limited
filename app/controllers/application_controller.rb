class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ad

  before_action :sessions

  def ad
    @new_events = Event.last(3)
  end

  def sessions
    session[:event_id] = nil
  end

  def add_event
    @organizations = Organization.all
    @staffs = Staff.all
    @locations = Location.all
  	@organization = Organization.new
  	@staff = Staff.new
    @event = Event.new
    @events_staff = EventsStaff.new
  end
end
