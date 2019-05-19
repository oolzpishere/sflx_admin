require 'rails_helper'

RSpec.describe Admin::ImagesController, type: :controller do
  routes { Admin::Engine.routes }
  # This should return the minimal set of attributes required to create a valid
  # Gallery. As you add validations to Gallery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {

  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:new_attributes) {

  }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GalleriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  login_user


end
