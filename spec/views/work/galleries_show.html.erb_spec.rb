require 'rails_helper'

RSpec.describe "work/galleries/show", type: :view do

  before(:each) do
    gallery = FactoryBot.create(:gallery_with_images)
    assign(:gallery, gallery)
    assign(:galleries, [gallery])
  end

  it "render a gallery show page" do
    render
    expect(rendered).to match /设计展示/
  end
end
