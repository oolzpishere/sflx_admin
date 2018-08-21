require 'rails_helper'

RSpec.describe "crequests/new", type: :view do
  before(:each) do
    assign(:crequest, Crequest.new())
  end

  it "renders new crequest form" do
    render

    assert_select "form[action=?][method=?]", crequests_path, "post" do
    end
  end
end
