require "rails_helper"

RSpec.describe CrequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/crequests").to route_to("crequests#index")
    end

    it "routes to #new" do
      expect(:get => "/crequests/new").to route_to("crequests#new")
    end

    it "routes to #show" do
      expect(:get => "/crequests/1").to route_to("crequests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/crequests/1/edit").to route_to("crequests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/crequests").to route_to("crequests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/crequests/1").to route_to("crequests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/crequests/1").to route_to("crequests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/crequests/1").to route_to("crequests#destroy", :id => "1")
    end

  end
end
