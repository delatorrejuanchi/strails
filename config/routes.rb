# frozen_string_literal: true

Strails::Engine.routes.draw do
  scope module: :backend, path: :admin, as: :backend do
    post "/change_locale", to: "locale#change_locale", as: :change_locale
    get "/dashboard", to: "dashboard#index", as: :dashboard
    resources :products do
      resources :variants
    end
    resources :option_types do
      resources :option_values
    end

    root to: redirect("admin/dashboard")
  end

  scope module: :frontend do
    post "/change_locale", to: "locale#change_locale", as: :change_locale
    root to: "home#index"
  end
end
