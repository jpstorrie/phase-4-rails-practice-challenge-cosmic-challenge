require "rails_helper"

RSpec.describe ScientistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/scientists").to route_to("scientists#index")
    end

    it "routes to #show" do
      expect(get: "/scientists/1").to route_to("scientists#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/scientists").to route_to("scientists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/scientists/1").to route_to("scientists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/scientists/1").to route_to("scientists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/scientists/1").to route_to("scientists#destroy", id: "1")
    end
  end
end
