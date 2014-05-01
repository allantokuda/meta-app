require "spec_helper"

describe Api::V1::EntitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/apps/1/entities").should route_to("api/v1/entities#index", :id => "1")
    end

    it "routes to #create" do
      post("/api/v1/apps/1/entities").should route_to("api/v1/entities#create", :id => "1")
    end

    it "routes to #show" do
      get("/api/v1/entities/1").should route_to("api/v1/entities#show", :id => "1")
    end

    it "routes to #update" do
      put("/api/v1/entities/1").should route_to("api/v1/entities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/v1/entities/1").should route_to("api/v1/entities#destroy", :id => "1")
    end

  end
end
