require 'spec_helper'

describe ObjectsController do

  before do
    module ExampleModule
      class ExampleObjectsController < ObjectsController; end
    end
    class ExampleObject; end
    @controller = ExampleModule::ExampleObjectsController.new
  end

  describe "#model_name" do
    it "looks up a data model name by naming conventions" do
      @controller.model_name.should == 'ExampleObject'
    end
  end

  describe "#model" do
    it "looks up a data model by naming conventions" do
      @controller.model.should == ExampleObject
    end
  end

  # This should return the minimal set of attributes required to create a valid
  # Object. As you add validations to Object, be sure to
  # adjust the attributes here as well.
  #let(:valid_attributes) { { "name" => "MyString" } }

  #describe "#index" do
  #  it "assigns all objects as @objects" do
  #    object = Example.create! valid_attributes
  #    get :index, {}, valid_session
  #    assigns(:objects).should eq([object])
  #  end
  #end

  #describe "GET show" do
  #  it "assigns the requested object as @object" do
  #    object = Example.create! valid_attributes
  #    get :show, {:id => object.to_param}, valid_session
  #    assigns(:object).should eq(object)
  #  end
  #end

  #describe "POST create" do
  #  describe "with valid params" do
  #    it "creates a new Example" do
  #      expect {
  #        post :create, {:object => valid_attributes}, valid_session
  #      }.to change(Example, :count).by(1)
  #    end

  #    it "assigns a newly created object as @object" do
  #      post :create, {:object => valid_attributes}, valid_session
  #      assigns(:object).should be_a(Example)
  #      assigns(:object).should be_persisted
  #    end
  #  end

  #  describe "with invalid params" do
  #    it "assigns a newly created but unsaved object as @object" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Example.any_instance.stub(:save).and_return(false)
  #      post :create, {:object => { "name" => "invalid value" }}, valid_session
  #      assigns(:object).should be_a_new(Example)
  #    end
  #  end
  #end

  #describe "PUT update" do
  #  describe "with valid params" do
  #    it "updates the requested object" do
  #      object = Example.create! valid_attributes
  #      # Assuming there are no other objects in the database, this
  #      # specifies that the Example created on the previous line
  #      # receives the :update_attributes message with whatever params are
  #      # submitted in the request.
  #      Example.any_instance.should_receive(:update).with({ "name" => "MyString" })
  #      put :update, {:id => object.to_param, :object => { "name" => "MyString" }}, valid_session
  #    end

  #    it "assigns the requested object as @object" do
  #      object = Example.create! valid_attributes
  #      put :update, {:id => object.to_param, :object => valid_attributes}, valid_session
  #      assigns(:object).should eq(object)
  #    end
  #  end

  #  describe "with invalid params" do
  #    it "assigns the object as @object" do
  #      object = Example.create! valid_attributes
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Example.any_instance.stub(:save).and_return(false)
  #      put :update, {:id => object.to_param, :object => { "name" => "invalid value" }}, valid_session
  #      assigns(:object).should eq(object)
  #    end
  #  end
  #end

  #describe "DELETE destroy" do
  #  it "destroys the requested object" do
  #    object = Example.create! valid_attributes
  #    expect {
  #      delete :destroy, {:id => object.to_param}, valid_session
  #    }.to change(Example, :count).by(-1)
  #  end
  #end

end
