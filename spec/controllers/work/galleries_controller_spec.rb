require 'rails_helper'

RSpec.describe Work::GalleriesController, type: :controller do
  routes { Work::Engine.routes }

  let(:valid_attributes) {
    {:id => 1,
    :title => "title",
    :body => "body",
    :side_body => "side_body",
    :position => 1,
    :cover => "cover",
    :first_img => "first_img"}
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("work/galleries/index")
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gallery = Work::Gallery.create! valid_attributes
      get :show, params: {id: gallery.to_param}
      expect(response).to be_success
      expect(response).to render_template("work/galleries/show")
    end
  end

end
