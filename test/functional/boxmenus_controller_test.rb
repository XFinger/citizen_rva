require 'test_helper'

class BoxmenusControllerTest < ActionController::TestCase
  setup do
    @boxmenu = boxmenus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boxmenus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boxmenu" do
    assert_difference('Boxmenu.count') do
      post :create, :boxmenu => @boxmenu.attributes
    end

    assert_redirected_to boxmenu_path(assigns(:boxmenu))
  end

  test "should show boxmenu" do
    get :show, :id => @boxmenu.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @boxmenu.to_param
    assert_response :success
  end

  test "should update boxmenu" do
    put :update, :id => @boxmenu.to_param, :boxmenu => @boxmenu.attributes
    assert_redirected_to boxmenu_path(assigns(:boxmenu))
  end

  test "should destroy boxmenu" do
    assert_difference('Boxmenu.count', -1) do
      delete :destroy, :id => @boxmenu.to_param
    end

    assert_redirected_to boxmenus_path
  end
end
