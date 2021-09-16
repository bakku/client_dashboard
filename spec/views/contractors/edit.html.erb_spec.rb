# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contractors/edit", type: :view do
  before(:each) do
    @contractor = assign(:contractor, create(:contractor))
  end

  it "renders the edit contractor form" do
    render

    assert_select "form[action=?][method=?]", contractor_path(@contractor), "post" do
      assert_select "input[name=?]", "contractor[first_name]"

      assert_select "input[name=?]", "contractor[last_name]"

      assert_select "select[name=?]", "contractor[partner_company_id]"
    end
  end
end
