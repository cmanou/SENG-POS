require 'test_helper'

class SupplierStockOrdersControllerTest < ActionController::TestCase
  setup do
    @supplier_stock_order = supplier_stock_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplier_stock_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier_stock_order" do
    assert_difference('SupplierStockOrder.count') do
      post :create, supplier_stock_order: { quantity: @supplier_stock_order.quantity, status: @supplier_stock_order.status }
    end

    assert_redirected_to supplier_stock_order_path(assigns(:supplier_stock_order))
  end

  test "should show supplier_stock_order" do
    get :show, id: @supplier_stock_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier_stock_order
    assert_response :success
  end

  test "should update supplier_stock_order" do
    put :update, id: @supplier_stock_order, supplier_stock_order: { quantity: @supplier_stock_order.quantity, status: @supplier_stock_order.status }
    assert_redirected_to supplier_stock_order_path(assigns(:supplier_stock_order))
  end

  test "should destroy supplier_stock_order" do
    assert_difference('SupplierStockOrder.count', -1) do
      delete :destroy, id: @supplier_stock_order
    end

    assert_redirected_to supplier_stock_orders_path
  end
end
