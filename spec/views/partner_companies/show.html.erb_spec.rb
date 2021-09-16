# frozen_string_literal: true

require "rails_helper"

RSpec.describe "partner_companies/show", type: :view do
  before(:each) do
    @partner_company = assign(:partner_company, create(:partner_company))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@partner_company.identity)
    expect(rendered).to match(@partner_company.name)
  end
end
