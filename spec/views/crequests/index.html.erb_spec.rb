require 'rails_helper'

RSpec.describe "crequests/index", type: :view do
  before(:each) do
    assign(:crequests, [
      Crequest.create!(),
      Crequest.create!()
    ])
  end

  it "renders a list of crequests" do
    render
  end
end
