# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class ProductsController < BackendController
      before_action :set_product, only: %i[show edit update destroy]

      # GET /admin/products
      def index
        @products = Product.all
      end

      # GET /admin/products/new
      def new
        @product = Product.new
      end

      def show
        redirect_to edit_backend_product_path(@product)
      end

      # GET /admin/products/1/edit
      def edit; end

      # POST /admin/products
      def create
        @product = Product.new(product_params)

        if @product.save
          redirect_to [:backend, @product], notice: "Product was successfully created."
        else
          render :new
        end
      end

      # PATCH/PUT /admin/products/1
      def update
        if @product.update(product_params)
          redirect_to [:backend, @product], notice: "Product was successfully updated."
        else
          render :edit
        end
      end

      # DELETE /admin/products/1
      def destroy
        if @product.destroy
          redirect_to backend_products_url, notice: "Product was successfully destroyed."
        else
          redirect_to [:backend, @product], error: "There was an error destroying this product."
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
