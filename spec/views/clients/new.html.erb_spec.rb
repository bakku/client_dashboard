# frozen_string_literal: true

require "rails_helper"

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, build(:client))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do
      assert_select "input[name=?]", "client[first_name]"

      assert_select "input[name=?]", "client[last_name]"
    end
  end
end
