# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contractors/show", type: :view do
  before(:each) do
    @contractor = assign(:contractor, create(:contractor))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@contractor.first_name)
    expect(rendered).to match(@contractor.last_name)
    expect(rendered).to match(@contractor.partner_company.name)
  end
end
