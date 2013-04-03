require 'test_helper'

class PunchclocksControllerTest < ActionController::TestCase
  setup do
    @punchclock = punchclocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punchclocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punchclock" do
    assert_difference('Punchclock.count') do
      post :create, punchclock: @punchclock.attributes
    end

    assert_redirected_to punchclock_path(assigns(:punchclock))
  end

  test "should show punchclock" do
    get :show, id: @punchclock.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @punchclock.to_param
    assert_response :success
  end

  test "should update punchclock" do
    put :update, id: @punchclock.to_param, punchclock: @punchclock.attributes
    assert_redirected_to punchclock_path(assigns(:punchclock))
  end

  test "should destroy punchclock" do
    assert_difference('Punchclock.count', -1) do
      delete :destroy, id: @punchclock.to_param
    end

    assert_redirected_to punchclocks_path
  end
end
