# frozen_string_literal: true

require "rails_helper"

RSpec.describe EmployeesController, type: :controller do
  let(:company) do
    create(:company)
  end

  let(:valid_attributes) do
    attributes_for(:employee).merge(company_id: company.id)
  end

  let(:invalid_attributes) do
    { first_name: nil, last_name: nil }
  end

  let(:valid_session) { {} }

  include AuthHelper

  before(:each) do
    http_login
  end

  describe "GET #index" do
    it "returns a success response" do
      Employee.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      employee = Employee.create! valid_attributes
      get :show, params: { id: employee.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      employee = Employee.create! valid_attributes
      get :edit, params: { id: employee.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employee" do
        expect do
          post :create, params: { employee: valid_attributes }, session: valid_session
        end.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post :create, params: { employee: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Employee.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { employee: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #import" do
    it "should return correct errors if excel is invalid" do
      post :import,
           session: valid_session,
           params: { file: file_fixture("missing_data.xlsx") }

      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body).keys).to include("error")
      expect(JSON.parse(response.body).keys).to include("detail")
    end

    it "should correctly create employees" do
      create(:company).tap { |c| c.update!(identity: "abc") }
      create(:company).tap { |c| c.update!(identity: "def") }
      create(:client).tap { |c| c.update!(ctoken: "abc") }
      create(:client).tap { |c| c.update!(ctoken: "def") }

      post :import,
           session: valid_session,
           params: { file: file_fixture("valid_excel.xlsx") }

      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { first_name: "First Name", last_name: "Last Name" }
      end

      it "updates the requested employee" do
        employee = Employee.create! valid_attributes
        put :update, params: { id: employee.to_param, employee: new_attributes }, session: valid_session
        employee.reload
        expect(employee.last_name).to eql new_attributes[:last_name]
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes
        put :update, params: { id: employee.to_param, employee: valid_attributes }, session: valid_session
        expect(response).to redirect_to(employee)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        employee = Employee.create! valid_attributes
        put :update, params: { id: employee.to_param, employee: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes
      expect do
        delete :destroy, params: { id: employee.to_param }, session: valid_session
      end.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes
      delete :destroy, params: { id: employee.to_param }, session: valid_session
      expect(response).to redirect_to(employees_url)
    end
  end
end
