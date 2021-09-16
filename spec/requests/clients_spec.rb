# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Clients", type: :request do
  describe "GET /clients" do
    it "works! (now write some real specs)" do
      get clients_path,
          headers: { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("username",
                                                                                                            "secret") }
      expect(response).to have_http_status(200)
    end
  end
end
