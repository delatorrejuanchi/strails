# frozen_string_literal: true

Strails::Engine.routes.draw do
  scope module: :backend, path: :admin, as: :backend do
    root to: "dashboard#index"
  end

  scope module: :frontend do
    root to: "home#index"
  end
end
