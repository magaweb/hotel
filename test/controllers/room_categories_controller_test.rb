require 'test_helper'

class RoomCategoriesControllerTest < ActionController::TestCase
  setup do
    @room_category = room_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_category" do
    assert_difference('RoomCategory.count') do
      post :create, room_category: { hotel_id: @room_category.hotel_id, name: @room_category.name }
    end

    assert_redirected_to room_category_path(assigns(:room_category))
  end

  test "should show room_category" do
    get :show, id: @room_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_category
    assert_response :success
  end

  test "should update room_category" do
    patch :update, id: @room_category, room_category: { hotel_id: @room_category.hotel_id, name: @room_category.name }
    assert_redirected_to room_category_path(assigns(:room_category))
  end

  test "should destroy room_category" do
    assert_difference('RoomCategory.count', -1) do
      delete :destroy, id: @room_category
    end

    assert_redirected_to room_categories_path
  end
end
