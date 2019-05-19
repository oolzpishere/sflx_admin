require 'rails_helper'

RSpec.describe Admin::GalleryTypesController, type: :controller do
  routes { Admin::Engine.routes }

  let(:valid_attributes) {
    {:id => 1,
    :gallery_type => "title",
    :position => 1,
    :eng_name => "eng_name"}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:new_attributes) {
    {:id => 1,
    :gallery_type => "title-new",
    :position => 1,
    :eng_name => "eng_name-new"}
  }

  let(:valid_session) { {} }

  login_user

  describe "Authenticate" do
    it "Authenticate success" do
      expect(subject.current_user).to_not eq(nil)
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      gallery = Work::GalleryType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gallery = Work::GalleryType.create! valid_attributes
      get :show, params: {id: gallery.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      gallery = Work::GalleryType.create! valid_attributes
      get :edit, params: {id: gallery.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Gallery" do
        expect {
          post :create, params: {gallery_type: valid_attributes}
        }.to change(Work::GalleryType, :count).by(1)
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested gallery" do
        gallery_type = Work::GalleryType.create! valid_attributes
        put :update, params: {id: gallery_type.to_param, gallery_type: new_attributes}, session: valid_session
        gallery_type_org = gallery_type.dup
        gallery_type.reload
        expect(gallery_type_org).to_not eq(gallery_type)
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested gallery" do
      gallery = Work::GalleryType.create! valid_attributes
      expect {
        delete :destroy, params: {id: gallery.to_param}, session: valid_session
      }.to change(Work::GalleryType, :count).by(-1)
    end
  end

end
