require "rails_helper"

RSpec.describe SpicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/spices").to route_to("spices#index")
    end

    it "routes to #show" do
      expect(get: "/spices/1").to route_to("spices#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/spices").to route_to("spices#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/spices/1").to route_to("spices#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/spices/1").to route_to("spices#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/spices/1").to route_to("spices#destroy", id: "1")
    end
  end
end
