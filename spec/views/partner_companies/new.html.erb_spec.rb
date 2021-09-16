# frozen_string_literal: true

require "rails_helper"

RSpec.describe "partner_companies/new", type: :view do
  before(:each) do
    assign(:partner_company, build(:partner_company))
  end

  it "renders new partner_company form" do
    render

    assert_select "form[action=?][method=?]", partner_companies_path, "post" do
      assert_select "input[name=?]", "partner_company[name]"
    end
  end
end
