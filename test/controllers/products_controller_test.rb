require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url: 'lorem.jpg',
      price: 19.95
    }
    @total_product = 3
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)

    assert_select "#main .list_image", @total_product
    assert_select "#main .list_description", @total_product
    assert_select "#main .list_action", @total_product
    assert_select "#main .list_action a", @total_product * 3
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_select "#main input#product_title", 1
    assert_select "#main textarea#product_description", 1
    assert_select "#main input#product_image_url", 1
    assert_select "#main input#product_price", 1
    assert_select "#main input[type='submit']", 1
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success

    assert_select "#main p", 4
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success

    assert_select "#main input#product_title", 1
    assert_select "#main textarea#product_description", 1
    assert_select "#main input#product_image_url", 1
    assert_select "#main input#product_price", 1
    assert_select "#main input[type='submit']", 1
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
