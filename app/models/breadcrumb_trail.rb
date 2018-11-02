# frozen_string_literal: true

class BreadcrumbTrail < Croutons::BreadcrumbTrail
  include Strails::Engine.routes.url_helpers

  def strails_backend_dashboard_index
    breadcrumb("Dashboard", backend_root_path)
  end

  def strails_backend_products_index
    breadcrumb("Products", backend_products_path)
  end

  def strails_backend_products_new
    strails_backend_products_index
    breadcrumb("New Product")
  end

  def strails_backend_products_edit
    strails_backend_products_index
    breadcrumb(objects[:product].name, backend_products_path(objects[:product]))
  end
end
