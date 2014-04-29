require 'spec_helper'

describe Api::V1::EntitiesController do
  let(:parent_model) { App }
  let(:object_model) { Entity }
  let(:model_name  ) { :entity }
  let(:siblings    ) { :entities }

  let(:valid_session) { {} }

  # This is a nested object so only those within a specific parent object should be retrieved
  describe "GET index" do
    it "responds with all sibling objects" do
      # seems that for a has_many relationship, :create is needed,
      # otherwise saving the parent does not automatically save the children
      parent = parent_model.create name: 'Example Parent'
      parent.send(siblings) << object_model.new( name: 'Example Object 1' )
      parent.send(siblings) << object_model.new( name: 'Example Object 2' )
      parent.save!
      get :index, {id: parent.id}, valid_session
      response.body.should match 'Example Object 1'
      response.body.should match 'Example Object 2'
      response.body.should_not match 'Example Parent'
    end
  end

  describe "POST create" do
    def create_within(parent)
      post :create, {
        :id => parent.id, 
        model_name => { 
          name: "Example Object",
          data_fields: [
            { name: 'Name', type: 'string' },
            { name: 'Age', type: 'integer' }
          ]
        }
      }, valid_session
    end

    describe "with valid params" do
      it "creates a new object" do
        parent = parent_model.create name: 'Example Parent'
        create_within(parent)
        response.status.should eq 201
        response.body.should match 'Example Object'
        response.body.should match '"name":"Age","type":"integer"'
        parent.reload
        parent.send(siblings).count.should == 1
      end
    end

    describe "when the parent object is not found" do
      it "responds with 'not found'" do
        post :create, {id: 12345, model_name => { name: "Example Object" }}, valid_session
        response.status.should eq 404
      end
    end

    describe "when the parent object exists but the object still does not save" do
      it "responds with 'unprocessable entity'" do
        parent = parent_model.create name: 'Example Parent'
        parent_model.any_instance.stub(:save).and_return(false)
        post :create, {id: parent.id, model_name => { name: "Example Object" }}, valid_session
        response.status.should be 422
      end
    end
  end

  describe "GET show" do
    context "when the object and its parent exist" do
      let(:object) { object_model.new    name: 'Example Object' }
      let(:parent) { parent_model.create name: 'Example Parent' }

      before do
        parent.send(siblings) << object
        parent.save
      end

      it "responds with the requested object" do
        get :show, {:id => object.to_param}, valid_session
        response.body.should match 'Example Object'
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested object" do
        object = object_model.create! name: 'Example Object'
        object_model.any_instance.should_receive(:update).with({ "name" => "Example Rename" })
        put :update, {:id => object.to_param, model_name => { "name" => "Example Rename" }}, valid_session
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested object" do
      object = object_model.create! name: 'Example Object'
      expect {
        delete :destroy, {:id => object.to_param}, valid_session
      }.to change(object_model, :count).by(-1)
    end
  end
end
