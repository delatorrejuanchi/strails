# frozen_string_literal: true

class BreadcrumbTrail < Croutons::BreadcrumbTrail
  include Strails::Engine.routes.url_helpers

  def strails_backend
    breadcrumb("Backend")
  end

  def strails_backend_dashboard_index
    strails_backend
    breadcrumb("Dashboard", backend_dashboard_path)
  end

  def strails_backend_products_index
    strails_backend
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

  def strails_backend_option_types_index
    strails_backend
    breadcrumb("Option Types", backend_option_types_path)
  end

  def strails_backend_option_types_new
    strails_backend_option_types_index
    breadcrumb("New Option Type")
  end

  def strails_backend_option_types_edit
    strails_backend_option_types_index
    breadcrumb(objects[:option_type].pretty_name, backend_option_types_path(objects[:option_type]))
  end
end
