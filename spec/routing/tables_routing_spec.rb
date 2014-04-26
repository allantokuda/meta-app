require "spec_helper"

describe Api::V1::TablesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/apps/1/tables").should route_to("api/v1/tables#index", :id => "1")
    end

    it "routes to #create" do
      post("/api/v1/apps/1/tables").should route_to("api/v1/tables#create", :id => "1")
    end

    it "routes to #show" do
      get("/api/v1/tables/1").should route_to("api/v1/tables#show", :id => "1")
    end

    it "routes to #update" do
      put("/api/v1/tables/1").should route_to("api/v1/tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/v1/tables/1").should route_to("api/v1/tables#destroy", :id => "1")
    end

  end
end
