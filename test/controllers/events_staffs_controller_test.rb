require 'test_helper'

class EventsStaffsControllerTest < ActionController::TestCase
  setup do
    @events_staff = events_staffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events_staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create events_staff" do
    assert_difference('EventsStaff.count') do
      post :create, events_staff: { event_id: @events_staff.event_id, staff_id: @events_staff.staff_id, staff_qr_code: @events_staff.staff_qr_code }
    end

    assert_redirected_to events_staff_path(assigns(:events_staff))
  end

  test "should show events_staff" do
    get :show, id: @events_staff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @events_staff
    assert_response :success
  end

  test "should update events_staff" do
    patch :update, id: @events_staff, events_staff: { event_id: @events_staff.event_id, staff_id: @events_staff.staff_id, staff_qr_code: @events_staff.staff_qr_code }
    assert_redirected_to events_staff_path(assigns(:events_staff))
  end

  test "should destroy events_staff" do
    assert_difference('EventsStaff.count', -1) do
      delete :destroy, id: @events_staff
    end

    assert_redirected_to events_staffs_path
  end
end
