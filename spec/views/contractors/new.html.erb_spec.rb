# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contractors/new", type: :view do
  before(:each) do
    assign(:contractor, build(:contractor))
  end

  it "renders new contractor form" do
    render

    assert_select "form[action=?][method=?]", contractors_path, "post" do
      assert_select "input[name=?]", "contractor[first_name]"

      assert_select "input[name=?]", "contractor[last_name]"

      assert_select "select[name=?]", "contractor[partner_company_id]"
    end
  end
end
