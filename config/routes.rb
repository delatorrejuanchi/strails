# frozen_string_literal: true

Strails::Engine.routes.draw do
  scope module: :backend, path: :admin, as: :backend do
    get "/dashboard", to: "dashboard#index", as: :dashboard
    resources :products
    resources :option_types do
      resources :option_values
    end

    root to: redirect("admin/dashboard")
  end

  scope module: :frontend do
    root to: "home#index"
  end
end
