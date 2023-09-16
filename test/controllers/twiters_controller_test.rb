require "test_helper"

class TwitersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twiter = twiters(:one)
  end

  test "should get index" do
    get twiters_url
    assert_response :success
  end

  test "should get new" do
    get new_twiter_url
    assert_response :success
  end

  test "should create twiter" do
    assert_difference("Twiter.count") do
      post twiters_url, params: { twiter: { description: @twiter.description, user_name: @twiter.user_name } }
    end

    assert_redirected_to twiter_url(Twiter.last)
  end

  test "should show twiter" do
    get twiter_url(@twiter)
    assert_response :success
  end

  test "should get edit" do
    get edit_twiter_url(@twiter)
    assert_response :success
  end

  test "should update twiter" do
    patch twiter_url(@twiter), params: { twiter: { description: @twiter.description, user_name: @twiter.user_name } }
    assert_redirected_to twiter_url(@twiter)
  end

  test "should destroy twiter" do
    assert_difference("Twiter.count", -1) do
      delete twiter_url(@twiter)
    end

    assert_redirected_to twiters_url
  end
end
