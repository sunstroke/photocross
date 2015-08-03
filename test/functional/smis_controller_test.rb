# -*- encoding : utf-8 -*-
require 'test_helper'

class SmisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smi" do
    assert_difference('Smi.count') do
      post :create, :smi => { }
    end

    assert_redirected_to smi_path(assigns(:smi))
  end

  test "should show smi" do
    get :show, :id => smis(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => smis(:one).to_param
    assert_response :success
  end

  test "should update smi" do
    put :update, :id => smis(:one).to_param, :smi => { }
    assert_redirected_to smi_path(assigns(:smi))
  end

  test "should destroy smi" do
    assert_difference('Smi.count', -1) do
      delete :destroy, :id => smis(:one).to_param
    end

    assert_redirected_to smis_path
  end
end
