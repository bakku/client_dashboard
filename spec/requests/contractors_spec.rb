# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Contractors", type: :request do
  describe "GET /contractors" do
    it "works! (now write some real specs)" do
      get contractors_path,
          headers: { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("username",
                                                                                                            "secret") }
      expect(response).to have_http_status(200)
    end
  end
end
