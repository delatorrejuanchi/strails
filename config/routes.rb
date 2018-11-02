# frozen_string_literal: true

Strails::Engine.routes.draw do
  scope module: :backend, path: :admin, as: :backend do
    get "/dashboard", to: "dashboard#index", as: :dashboard
    resources :products
    resources :option_types

    root to: "dashboard#index"
  end

  scope module: :frontend do
    root to: "home#index"
  end
end
