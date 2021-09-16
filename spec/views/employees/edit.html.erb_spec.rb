# frozen_string_literal: true

require "rails_helper"

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, create(:employee))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do
      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "select[name=?]", "employee[company_id]"
    end
  end
end
