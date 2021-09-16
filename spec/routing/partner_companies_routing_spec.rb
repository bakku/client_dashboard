# frozen_string_literal: true

require "rails_helper"

RSpec.describe PartnerCompaniesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/partner_companies").to route_to("partner_companies#index")
    end

    it "routes to #new" do
      expect(get: "/partner_companies/new").to route_to("partner_companies#new")
    end

    it "routes to #show" do
      expect(get: "/partner_companies/1").to route_to("partner_companies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/partner_companies/1/edit").to route_to("partner_companies#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/partner_companies").to route_to("partner_companies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/partner_companies/1").to route_to("partner_companies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/partner_companies/1").to route_to("partner_companies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/partner_companies/1").to route_to("partner_companies#destroy", id: "1")
    end
  end
end
