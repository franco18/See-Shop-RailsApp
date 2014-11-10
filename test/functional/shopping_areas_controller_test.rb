require 'test_helper'

class ShoppingAreasControllerTest < ActionController::TestCase
  setup do
    @shopping_area = shopping_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_area" do
    assert_difference('ShoppingArea.count') do
      post :create, shopping_area: { latitude: @shopping_area.latitude, longitude: @shopping_area.longitude, name: @shopping_area.name }
    end

    assert_redirected_to shopping_area_path(assigns(:shopping_area))
  end

  test "should show shopping_area" do
    get :show, id: @shopping_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_area
    assert_response :success
  end

  test "should update shopping_area" do
    put :update, id: @shopping_area, shopping_area: { latitude: @shopping_area.latitude, longitude: @shopping_area.longitude, name: @shopping_area.name }
    assert_redirected_to shopping_area_path(assigns(:shopping_area))
  end

  test "should destroy shopping_area" do
    assert_difference('ShoppingArea.count', -1) do
      delete :destroy, id: @shopping_area
    end

    assert_redirected_to shopping_areas_path
  end
end
