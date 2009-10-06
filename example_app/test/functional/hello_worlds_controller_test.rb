require 'test_helper'

class HelloWorldsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hello_worlds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hello_world" do
    assert_difference('HelloWorld.count') do
      post :create, :hello_world => { }
    end

    assert_redirected_to hello_world_path(assigns(:hello_world))
  end

  test "should show hello_world" do
    get :show, :id => hello_worlds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hello_worlds(:one).to_param
    assert_response :success
  end

  test "should update hello_world" do
    put :update, :id => hello_worlds(:one).to_param, :hello_world => { }
    assert_redirected_to hello_world_path(assigns(:hello_world))
  end

  test "should destroy hello_world" do
    assert_difference('HelloWorld.count', -1) do
      delete :destroy, :id => hello_worlds(:one).to_param
    end

    assert_redirected_to hello_worlds_path
  end
end
