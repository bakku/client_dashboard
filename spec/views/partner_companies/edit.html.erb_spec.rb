# frozen_string_literal: true

require "rails_helper"

RSpec.describe "partner_companies/edit", type: :view do
  before(:each) do
    @partner_company = assign(:partner_company, create(:partner_company))
  end

  it "renders the edit partner_company form" do
    render

    assert_select "form[action=?][method=?]", partner_company_path(@partner_company), "post" do
      assert_select "input[name=?]", "partner_company[name]"
    end
  end
end
