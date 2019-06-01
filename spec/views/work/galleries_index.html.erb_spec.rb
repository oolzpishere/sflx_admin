require 'rails_helper'

RSpec.describe "work/galleries/index", type: :view do
  let(:gallery) {
    FactoryBot.create(:gallery)
  }

  before(:each) do
    assign(:galleries, [
      gallery
    ])
  end

  it "renders a galleries index page" do
    # byebug
    render
    expect(rendered).to match /设计服务首页/
  end
end
