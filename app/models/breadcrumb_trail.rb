# frozen_string_literal: true

class BreadcrumbTrail < Croutons::BreadcrumbTrail
  include Strails::Engine.routes.url_helpers
  include Strails::TranslationsHelper

  def strails_backend
    breadcrumb(t("backend"))
  end

  def strails_backend_dashboard_index
    strails_backend
    breadcrumb(t("dashboard"), backend_dashboard_path)
  end

  def strails_backend_products_index
    strails_backend
    breadcrumb(translated_model_name("product", plural: true), backend_products_path)
  end

  def strails_backend_products_new
    strails_backend_products_index
    breadcrumb(t("new_product"))
  end

  def strails_backend_products_edit
    strails_backend_products_index
    breadcrumb(objects[:product].name, backend_product_path(objects[:product]))
  end

  def strails_backend_option_types_index
    strails_backend
    breadcrumb(translated_model_name("option_type", plural: true), backend_option_types_path)
  end

  def strails_backend_option_types_new
    strails_backend_option_types_index
    breadcrumb(t("new_option_type"))
  end

  def strails_backend_option_types_edit
    strails_backend_option_types_index
    breadcrumb(objects[:option_type].pretty_name, backend_option_type_path(objects[:option_type]))
  end

  def strails_backend_option_values_index
    strails_backend_option_types_edit
    breadcrumb(translated_model_name("option_value", plural: true),
               backend_option_type_option_values_path(objects[:option_type]))
  end

  def strails_backend_option_values_new
    strails_backend_option_values_index
    breadcrumb(t("new_option_value"))
  end

  def strails_backend_option_values_edit
    strails_backend_option_values_index
    breadcrumb(objects[:option_value].pretty_name,
               backend_option_type_option_value_path(objects[:option_type], objects[:option_value]))
  end

  def strails_backend_variants_index
    strails_backend_products_edit
    breadcrumb(translated_model_name("variant", plural: true), backend_product_variants_path(objects[:product]))
  end

  def strails_backend_variants_new
    strails_backend_variants_index
    breadcrumb(t("new_variant"))
  end

  def strails_backend_variants_edit
    strails_backend_variants_index
    breadcrumb(objects[:variant].sku, backend_product_variant_path(objects[:product], objects[:variant]))
  end
end
