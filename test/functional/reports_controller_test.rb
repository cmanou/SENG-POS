require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sale" do
    get :sale
    assert_response :success
  end

  test "should get stock" do
    get :stock
    assert_response :success
  end

  test "should get financial" do
    get :financial
    assert_response :success
  end

  test "should get staff" do
    get :staff
    assert_response :success
  end

  test "should get supplier" do
    get :supplier
    assert_response :success
  end

  test "should get customer" do
    get :customer
    assert_response :success
  end

end
