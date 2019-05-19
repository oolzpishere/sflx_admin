require 'rails_helper'

RSpec.describe Frontend::PagesController, type: :controller do
  routes { Frontend::Engine.routes }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end
  end

  describe "GET #index shared template test" do
    it "render shared template" do
      get :index
      expect(response).to render_template("shared/layouts/application")
    end
  end

end
