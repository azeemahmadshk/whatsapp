require "test_helper"

class UserRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_room = user_rooms(:one)
  end

  test "should get index" do
    get user_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_user_room_url
    assert_response :success
  end

  test "should create user_room" do
    assert_difference('UserRoom.count') do
      post user_rooms_url, params: { user_room: {  } }
    end

    assert_redirected_to user_room_url(UserRoom.last)
  end

  test "should show user_room" do
    get user_room_url(@user_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_room_url(@user_room)
    assert_response :success
  end

  test "should update user_room" do
    patch user_room_url(@user_room), params: { user_room: {  } }
    assert_redirected_to user_room_url(@user_room)
  end

  test "should destroy user_room" do
    assert_difference('UserRoom.count', -1) do
      delete user_room_url(@user_room)
    end

    assert_redirected_to user_rooms_url
  end
end
