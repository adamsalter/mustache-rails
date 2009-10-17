require 'spec_helper'

describe HelloWorldsController do

  def mock_hello_world(stubs={})
    @mock_hello_world ||= mock_model(HelloWorld, stubs)
  end

  describe "GET index" do
    it "assigns all hello_worlds as @hello_worlds" do
      HelloWorld.stub!(:find).with(:all).and_return([mock_hello_world])
      get :index
      assigns[:hello_worlds].should == [mock_hello_world]
    end
  end

  describe "GET show" do
    it "assigns the requested hello_world as @hello_world" do
      HelloWorld.stub!(:find).with("37").and_return(mock_hello_world)
      get :show, :id => "37"
      assigns[:hello_world].should equal(mock_hello_world)
    end
  end

  describe "GET new" do
    it "assigns a new hello_world as @hello_world" do
      HelloWorld.stub!(:new).and_return(mock_hello_world)
      get :new
      assigns[:hello_world].should equal(mock_hello_world)
    end
  end

  describe "GET edit" do
    it "assigns the requested hello_world as @hello_world" do
      HelloWorld.stub!(:find).with("37").and_return(mock_hello_world)
      get :edit, :id => "37"
      assigns[:hello_world].should equal(mock_hello_world)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created hello_world as @hello_world" do
        HelloWorld.stub!(:new).with({'these' => 'params'}).and_return(mock_hello_world(:save => true))
        post :create, :hello_world => {:these => 'params'}
        assigns[:hello_world].should equal(mock_hello_world)
      end

      it "redirects to the created hello_world" do
        HelloWorld.stub!(:new).and_return(mock_hello_world(:save => true))
        post :create, :hello_world => {}
        response.should redirect_to(hello_world_url(mock_hello_world))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hello_world as @hello_world" do
        HelloWorld.stub!(:new).with({'these' => 'params'}).and_return(mock_hello_world(:save => false))
        post :create, :hello_world => {:these => 'params'}
        assigns[:hello_world].should equal(mock_hello_world)
      end

      it "re-renders the 'new' template" do
        HelloWorld.stub!(:new).and_return(mock_hello_world(:save => false))
        post :create, :hello_world => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested hello_world" do
        HelloWorld.should_receive(:find).with("37").and_return(mock_hello_world)
        mock_hello_world.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :hello_world => {:these => 'params'}
      end

      it "assigns the requested hello_world as @hello_world" do
        HelloWorld.stub!(:find).and_return(mock_hello_world(:update_attributes => true))
        put :update, :id => "1"
        assigns[:hello_world].should equal(mock_hello_world)
      end

      it "redirects to the hello_world" do
        HelloWorld.stub!(:find).and_return(mock_hello_world(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(hello_world_url(mock_hello_world))
      end
    end

    describe "with invalid params" do
      it "updates the requested hello_world" do
        HelloWorld.should_receive(:find).with("37").and_return(mock_hello_world)
        mock_hello_world.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :hello_world => {:these => 'params'}
      end

      it "assigns the hello_world as @hello_world" do
        HelloWorld.stub!(:find).and_return(mock_hello_world(:update_attributes => false))
        put :update, :id => "1"
        assigns[:hello_world].should equal(mock_hello_world)
      end

      it "re-renders the 'edit' template" do
        HelloWorld.stub!(:find).and_return(mock_hello_world(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested hello_world" do
      HelloWorld.should_receive(:find).with("37").and_return(mock_hello_world)
      mock_hello_world.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the hello_worlds list" do
      HelloWorld.stub!(:find).and_return(mock_hello_world(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(hello_worlds_url)
    end
  end

end
