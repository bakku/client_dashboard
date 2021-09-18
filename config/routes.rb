# frozen_string_literal: true

Rails.application.routes.draw do
  root "companies#index"
  resources :clients
  resources :contractors
  resources :partner_companies

  resources :employees do
    collection do
      post :import
    end
  end

  resources :companies
end
