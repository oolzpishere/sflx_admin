require 'rails_helper'

RSpec.describe Frontend::PagesController, type: :routing do
  routes { Frontend::Engine.routes }

  describe "GET #show" do
    it "returns a success response" do
      expect(:get => '/about').
            to route_to(:controller => "frontend/pages", :action => "show")
    end
  end
end
