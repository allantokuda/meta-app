require 'spec_helper'

describe Api::V1::AppsController do
  let(:model) { App }

  let(:valid_attributes) { { "name" => "My Example" } }
  let(:valid_session) { {} }

  # Apps is a top-level object (it has no parents)
  # so all of its records should be retrieved
  describe "#index" do
    it "assigns all objects as @objects" do
      object = model.create! valid_attributes
      get :index, {}, valid_session
      response.body.should match 'My Example'
    end
  end

  describe "GET show" do
    it "assigns the requested object as @object" do
      object = model.create! valid_attributes
      get :show, {:id => object.to_param}, valid_session
      response.body.should match 'My Example'
    end
  end

  #describe "POST create" do
  #  describe "with valid params" do
  #    it "creates a new model" do
  #      expect {
  #        post :create, { :app => valid_attributes}, valid_session
  #      }.to change(model, :count).by(1)
  #    end

  #    it "assigns a newly created object as @object" do
  #      post :create, {:object => valid_attributes}, valid_session
  #      assigns(:object).should be_a(model)
  #      assigns(:object).should be_persisted
  #    end
  #  end

  #  describe "with invalid params" do
  #    it "assigns a newly created but unsaved object as @object" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      model.any_instance.stub(:save).and_return(false)
  #      post :create, {:object => { "name" => "invalid value" }}, valid_session
  #      assigns(:object).should be_a_new(model)
  #    end
  #  end
  #end

  #describe "PUT update" do
  #  describe "with valid params" do
  #    it "updates the requested object" do
  #      object = model.create! valid_attributes
  #      # Assuming there are no other objects in the database, this
  #      # specifies that the model created on the previous line
  #      # receives the :update_attributes message with whatever params are
  #      # submitted in the request.
  #      model.any_instance.should_receive(:update).with({ "name" => "MyString" })
  #      put :update, {:id => object.to_param, :object => { "name" => "MyString" }}, valid_session
  #    end

  #    it "assigns the requested object as @object" do
  #      object = model.create! valid_attributes
  #      put :update, {:id => object.to_param, :object => valid_attributes}, valid_session
  #      assigns(:object).should eq(object)
  #    end
  #  end

  #  describe "with invalid params" do
  #    it "assigns the object as @object" do
  #      object = model.create! valid_attributes
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      model.any_instance.stub(:save).and_return(false)
  #      put :update, {:id => object.to_param, :object => { "name" => "invalid value" }}, valid_session
  #      assigns(:object).should eq(object)
  #    end
  #  end
  #end

  #describe "DELETE destroy" do
  #  it "destroys the requested object" do
  #    object = model.create! valid_attributes
  #    expect {
  #      delete :destroy, {:id => object.to_param}, valid_session
  #    }.to change(model, :count).by(-1)
  #  end
  #end
end
