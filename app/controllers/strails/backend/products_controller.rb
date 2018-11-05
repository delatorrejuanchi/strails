# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class ProductsController < BackendController
      before_action :set_product, only: %i[show edit update destroy]

      def index
        @products = Product.all
      end

      def new
        @product = Product.new
      end

      def show
        redirect_to edit_backend_product_path(@product)
      end

      def edit; end

      def create
        @product = Product.new(product_params)

        if @product.save
          redirect_to backend_product_path(@product),
                      notice: t("successfully_created", model_name: translated_model_name("product"))
        else
          render :new
        end
      end

      def update
        if @product.update(product_params)
          redirect_to backend_product_path(@product),
                      notice: t("successfully_updated", model_name: translated_model_name("product"))
        else
          render :edit
        end
      end

      def destroy
        if @product.destroy
          redirect_to backend_products_path,
                      notice: t("successfully_destroyed", model_name: translated_model_name("product"))
        else
          redirect_to backend_product_path(@product),
                      error: t("errors.could_not_destroy", model_name: translated_model_name("product"))
        end
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description)
      end
    end
  end
end
