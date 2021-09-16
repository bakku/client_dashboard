# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path,
          headers: { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("username",
                                                                                                            "secret") }
      expect(response).to have_http_status(200)
    end
  end
end
