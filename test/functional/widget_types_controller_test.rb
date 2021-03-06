require 'test_helper'

class WidgetTypesControllerTest < ActionController::TestCase
  setup do
    @widget_type = widget_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:widget_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create widget_type" do
    assert_difference('WidgetType.count') do
      post :create, widget_type: @widget_type.attributes
    end

    assert_redirected_to widget_type_path(assigns(:widget_type))
  end

  test "should show widget_type" do
    get :show, id: @widget_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @widget_type
    assert_response :success
  end

  test "should update widget_type" do
    put :update, id: @widget_type, widget_type: @widget_type.attributes
    assert_redirected_to widget_type_path(assigns(:widget_type))
  end

  test "should destroy widget_type" do
    assert_difference('WidgetType.count', -1) do
      delete :destroy, id: @widget_type
    end

    assert_redirected_to widget_types_path
  end
end
