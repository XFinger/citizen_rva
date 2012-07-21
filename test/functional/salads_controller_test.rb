require 'test_helper'

class SaladsControllerTest < ActionController::TestCase
  setup do
    @salad = salads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salad" do
    assert_difference('Salad.count') do
      post :create, :salad => @salad.attributes
    end

    assert_redirected_to salad_path(assigns(:salad))
  end

  test "should show salad" do
    get :show, :id => @salad.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @salad.to_param
    assert_response :success
  end

  test "should update salad" do
    put :update, :id => @salad.to_param, :salad => @salad.attributes
    assert_redirected_to salad_path(assigns(:salad))
  end

  test "should destroy salad" do
    assert_difference('Salad.count', -1) do
      delete :destroy, :id => @salad.to_param
    end

    assert_redirected_to salads_path
  end
end
