require 'test_helper'

class DashTypesControllerTest < ActionController::TestCase
  setup do
    @dash_type = dash_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dash_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dash_type" do
    assert_difference('DashType.count') do
      post :create, dash_type: @dash_type.attributes
    end

    assert_redirected_to dash_type_path(assigns(:dash_type))
  end

  test "should show dash_type" do
    get :show, id: @dash_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dash_type
    assert_response :success
  end

  test "should update dash_type" do
    put :update, id: @dash_type, dash_type: @dash_type.attributes
    assert_redirected_to dash_type_path(assigns(:dash_type))
  end

  test "should destroy dash_type" do
    assert_difference('DashType.count', -1) do
      delete :destroy, id: @dash_type
    end

    assert_redirected_to dash_types_path
  end
end
