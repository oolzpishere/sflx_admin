require 'rails_helper'

RSpec.describe "galleries/index", type: :view do
  before(:each) do
    assign(:galleries, [
      Gallery.create!(),
      Gallery.create!()
    ])
  end

  it "renders a list of galleries" do
    render
  end
end
