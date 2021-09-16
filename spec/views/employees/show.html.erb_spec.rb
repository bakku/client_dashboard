# frozen_string_literal: true

require "rails_helper"

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, create(:employee))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@employee.identifier)
    expect(rendered).to match(@employee.first_name)
    expect(rendered).to match(@employee.last_name)
    expect(rendered).to match(@employee.company.name)
  end
end
