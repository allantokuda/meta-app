require 'spec_helper'

describe Api::V1::TablesController do
  let(:parent_model) { App }
  let(:object_model) { Table }

  let(:valid_session) { {} }

  # Table is a nested object within App
  # so only those within a specific App should be retrieved
  describe "GET index" do
    it "responds with all sibling objects" do
      parent = parent_model.new name: 'Example Parent'
      parent.tables << object_model.new( name: 'Example Object 1' )
      parent.tables << object_model.new( name: 'Example Object 2' )
      parent.save!
      get :index, {id: parent.id}, valid_session
      response.body.should match 'Example Object 1'
      response.body.should match 'Example Object 2'
      response.body.should_not match 'Example Parent'
    end
  end

  #describe "GET show" do
  #  it "responds with the requested object" do
  #    object = model.create! valid_attributes
  #    get :show, {:id => object.to_param}, valid_session
  #    response.body.should match 'My Example'
  #  end
  #end

  #describe "POST create" do
  #  describe "with valid params" do
  #    it "creates a new object" do
  #      expect {
  #        post :create, {:app => valid_attributes}, valid_session
  #      }.to change(model, :count).by(1)
  #    end

  #    it "responds with the newly created object" do
  #      post :create, {:app => valid_attributes}, valid_session
  #      response.body.should match 'My Example'
  #    end
  #  end

  #  describe "when the object does not save" do
  #    it "responds with 'unprocessable entity'" do
  #      model.any_instance.stub(:save).and_return(false)
  #      post :create, {:app => valid_attributes}, valid_session
  #      response.status.should be 422
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
  #      put :update, {:id => object.to_param, :app => { "name" => "MyString" }}, valid_session
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
