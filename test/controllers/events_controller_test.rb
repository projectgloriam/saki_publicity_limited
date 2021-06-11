require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { event_date_end: @event.event_date_end, event_date_start: @event.event_date_start, event_description: @event.event_description, event_name: @event.event_name, event_time_end: @event.event_time_end, event_time_start: @event.event_time_start, organization_id: @event.organization_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { event_date_end: @event.event_date_end, event_date_start: @event.event_date_start, event_description: @event.event_description, event_name: @event.event_name, event_time_end: @event.event_time_end, event_time_start: @event.event_time_start, organization_id: @event.organization_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
