# frozen_string_literal: true

Rails.application.routes.draw do
  root "companies#index"
  resources :clients
  resources :contractors
  resources :partner_companies
  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
