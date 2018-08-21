require 'rails_helper'

RSpec.describe "crequests/show", type: :view do
  before(:each) do
    @crequest = assign(:crequest, Crequest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
