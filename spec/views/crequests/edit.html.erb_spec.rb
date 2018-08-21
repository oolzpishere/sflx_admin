require 'rails_helper'

RSpec.describe "crequests/edit", type: :view do
  before(:each) do
    @crequest = assign(:crequest, Crequest.create!())
  end

  it "renders the edit crequest form" do
    render

    assert_select "form[action=?][method=?]", crequest_path(@crequest), "post" do
    end
  end
end
