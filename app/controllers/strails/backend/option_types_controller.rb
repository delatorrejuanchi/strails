# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class OptionTypesController < BackendController
      before_action :set_option_type, only: %i[show edit update destroy]

      # GET /backend/option_types
      def index
        @option_types = OptionType.all
      end

      # GET /backend/option_types/1
      def show
        redirect_to edit_backend_option_type_path(@option_type)
      end

      # GET /backend/option_types/new
      def new
        @option_type = OptionType.new
      end

      # GET /backend/option_types/1/edit
      def edit; end

      # POST /backend/option_types
      def create
        @option_type = OptionType.new(option_type_params)

        if @option_type.save
          redirect_to [:backend, @option_type], notice: "Option Type was successfully created."
        else
          render :new
        end
      end

      # PATCH/PUT /backend/option_types/1
      def update
        if @option_type.update(option_type_params)
          redirect_to [:backend, @option_type], notice: "Option Type was successfully updated."
        else
          render :edit
        end
      end

      # DELETE /backend/option_types/1
      def destroy
        @option_type.destroy
        redirect_to backend_option_types_url, notice: "Option Type was successfully destroyed."
      end

      private

      def set_option_type
        @option_type = OptionType.find(params[:id])
      end

      def option_type_params
        params.require(:option_type).permit(:name, :presentation)
      end
    end
  end
end