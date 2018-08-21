require 'rails_helper'

RSpec.describe "Crequests", type: :request do
  describe "GET /crequests" do
    it "works! (now write some real specs)" do
      get crequests_path
      expect(response).to have_http_status(200)
    end
  end
end
