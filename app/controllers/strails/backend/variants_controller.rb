# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class VariantsController < BackendController
      before_action :set_product
      before_action :set_variant, only: %i[show edit update destroy]

      def index
        @variants = @product.variants
      end

      def show
        redirect_to edit_backend_product_variant_path(@product, @variant)
      end

      def new
        @variant = @product.variants.build
        @option_values = OptionValue.all
      end

      def edit; end

      def create
        @variant = @product.variants.build(variant_params)

        option_values = OptionValue.where(id: option_value_params[:option_value_ids])
        @variant.option_values = option_values unless option_values.empty?

        if @variant.save
          redirect_to backend_product_variants_path(@product),
                      notice: t("successfully_created", model_name: translated_model_name("variant"))
        else
          @option_values = OptionValue.all
          render :new
        end
      end

      def update
        if @variant.update(variant_params)
          redirect_to backend_product_variant_path(@product, @variant),
                      notice: t("successfully_updated", model_name: translated_model_name("variant"))
        else
          render :edit
        end
      end

      def destroy
        if @variant.destroy
          redirect_to backend_product_variants_path(@product),
                      notice: t("successfully_destroyed", model_name: translated_model_name("variant"))
        else
          redirect_to backend_product_variant_path(@product, @variant),
                      error: t("errors.could_not_destroy", model_name: translated_model_name("variant"))
        end
      end

      private

      def set_variant
        @variant = @product.variants.find(params[:id])
      end

      def set_product
        @product = Product.find(params[:product_id])
      end

      def variant_params
        params.require(:variant).permit(:sku, :price)
      end

      def option_value_params
        params.require(:variant).permit(option_value_ids: [])
      end
    end
  end
end
