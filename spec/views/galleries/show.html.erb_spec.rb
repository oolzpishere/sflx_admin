require 'rails_helper'

RSpec.describe "galleries/show", type: :view do
  before(:each) do
    @gallery = assign(:gallery, Gallery.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
