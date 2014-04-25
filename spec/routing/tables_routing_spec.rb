require "spec_helper"

describe Api::TablesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/apps/1/tables").should route_to("api/tables#index", :id => "1")
    end

    it "routes to #create" do
      post("/api/apps/1/tables").should route_to("api/tables#create", :id => "1")
    end

    it "routes to #show" do
      get("/api/tables/1").should route_to("api/tables#show", :id => "1")
    end

    it "routes to #update" do
      put("/api/tables/1").should route_to("api/tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/tables/1").should route_to("api/tables#destroy", :id => "1")
    end

  end
end
