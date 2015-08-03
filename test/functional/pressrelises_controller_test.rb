# -*- encoding : utf-8 -*-
require 'test_helper'

class PressrelisesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pressrelises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pressrelise" do
    assert_difference('Pressrelise.count') do
      post :create, :pressrelise => { }
    end

    assert_redirected_to pressrelise_path(assigns(:pressrelise))
  end

  test "should show pressrelise" do
    get :show, :id => pressrelises(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pressrelises(:one).to_param
    assert_response :success
  end

  test "should update pressrelise" do
    put :update, :id => pressrelises(:one).to_param, :pressrelise => { }
    assert_redirected_to pressrelise_path(assigns(:pressrelise))
  end

  test "should destroy pressrelise" do
    assert_difference('Pressrelise.count', -1) do
      delete :destroy, :id => pressrelises(:one).to_param
    end

    assert_redirected_to pressrelises_path
  end
end
