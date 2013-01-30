require 'test_helper'

class MenuRestaurantsControllerTest < ActionController::TestCase
  setup do
    @menu_restaurant = menu_restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_restaurant" do
    assert_difference('MenuRestaurant.count') do
      post :create, menu_restaurant: { date: @menu_restaurant.date }
    end

    assert_redirected_to menu_restaurant_path(assigns(:menu_restaurant))
  end

  test "should show menu_restaurant" do
    get :show, id: @menu_restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_restaurant
    assert_response :success
  end

  test "should update menu_restaurant" do
    put :update, id: @menu_restaurant, menu_restaurant: { date: @menu_restaurant.date }
    assert_redirected_to menu_restaurant_path(assigns(:menu_restaurant))
  end

  test "should destroy menu_restaurant" do
    assert_difference('MenuRestaurant.count', -1) do
      delete :destroy, id: @menu_restaurant
    end

    assert_redirected_to menu_restaurants_path
  end
end
