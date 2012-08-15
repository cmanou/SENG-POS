require 'test_helper'

class StockLevelsControllerTest < ActionController::TestCase
  setup do
    @stock_level = stock_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_level" do
    assert_difference('StockLevel.count') do
      post :create, stock_level: {  }
    end

    assert_redirected_to stock_level_path(assigns(:stock_level))
  end

  test "should show stock_level" do
    get :show, id: @stock_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_level
    assert_response :success
  end

  test "should update stock_level" do
    put :update, id: @stock_level, stock_level: {  }
    assert_redirected_to stock_level_path(assigns(:stock_level))
  end

  test "should destroy stock_level" do
    assert_difference('StockLevel.count', -1) do
      delete :destroy, id: @stock_level
    end

    assert_redirected_to stock_levels_path
  end
end
