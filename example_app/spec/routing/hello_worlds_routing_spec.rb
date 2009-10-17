require 'spec_helper'

describe HelloWorldsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/hello_worlds" }.should route_to(:controller => "hello_worlds", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/hello_worlds/new" }.should route_to(:controller => "hello_worlds", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/hello_worlds/1" }.should route_to(:controller => "hello_worlds", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/hello_worlds/1/edit" }.should route_to(:controller => "hello_worlds", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/hello_worlds" }.should route_to(:controller => "hello_worlds", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/hello_worlds/1" }.should route_to(:controller => "hello_worlds", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/hello_worlds/1" }.should route_to(:controller => "hello_worlds", :action => "destroy", :id => "1") 
    end
  end
end
