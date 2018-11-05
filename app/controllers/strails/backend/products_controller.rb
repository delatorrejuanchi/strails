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
          redirect_to backend_product_path(@product), notice: "Product was successfully created."
        else
          render :new
        end
      end

      def update
        if @product.update(product_params)
          redirect_to backend_product_path(@product), notice: "Product was successfully updated."
        else
          render :edit
        end
      end

      def destroy
        if @product.destroy
          redirect_to backend_products_path, notice: "Product was successfully destroyed."
        else
          redirect_to backend_product_path(@product), error: "There was an error destroying this product."
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
