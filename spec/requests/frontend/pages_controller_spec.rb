require 'rails_helper'

RSpec.describe Frontend::PagesController, type: :request do
  describe "GET #show" do
    it "returns a success response" do
      get '/about'
      expect(response).to be_success
      expect(response).to render_template("about")
    end

    it "returns a success response" do
      get '/conference'
      expect(response).to be_success
      expect(response).to render_template("conference")
    end

    it "returns a success response" do
      get '/web'
      expect(response).to be_success
      expect(response).to render_template("web")
    end

    it "returns a success response" do
      get '/contact'
      expect(response).to be_success
      expect(response).to render_template("contact")
    end

    it "returns a success response" do
      get '/contact/find_us'
      expect(response).to be_success
      expect(response).to render_template("contact_find_us")
    end

  end
end
