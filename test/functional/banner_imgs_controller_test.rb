require 'test_helper'

class BannerImgsControllerTest < ActionController::TestCase
  setup do
    @banner_img = banner_imgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banner_imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banner_img" do
    assert_difference('BannerImg.count') do
      post :create, banner_img: { banner_id: @banner_img.banner_id, img: @banner_img.img, left: @banner_img.left, pos: @banner_img.pos, sp: @banner_img.sp, top: @banner_img.top, z: @banner_img.z }
    end

    assert_redirected_to banner_img_path(assigns(:banner_img))
  end

  test "should show banner_img" do
    get :show, id: @banner_img
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banner_img
    assert_response :success
  end

  test "should update banner_img" do
    put :update, id: @banner_img, banner_img: { banner_id: @banner_img.banner_id, img: @banner_img.img, left: @banner_img.left, pos: @banner_img.pos, sp: @banner_img.sp, top: @banner_img.top, z: @banner_img.z }
    assert_redirected_to banner_img_path(assigns(:banner_img))
  end

  test "should destroy banner_img" do
    assert_difference('BannerImg.count', -1) do
      delete :destroy, id: @banner_img
    end

    assert_redirected_to banner_imgs_path
  end
end
