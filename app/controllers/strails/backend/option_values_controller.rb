# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class OptionValuesController < BackendController
      before_action :set_option_type
      before_action :set_option_value, only: %i[show edit update destroy]

      # GET /backend/option_values
      def index
        @option_values = @option_type.option_values
      end

      # GET /backend/option_values/1
      def show
        redirect_to edit_backend_option_type_option_value_path(@option_type, @option_value)
      end

      # GET /backend/option_values/new
      def new
        @option_value = @option_type.option_values.build
      end

      # GET /backend/option_values/1/edit
      def edit; end

      # POST /backend/option_values
      def create
        @option_value = @option_type.option_values.build(option_value_params)

        if @option_value.save
          redirect_to backend_option_type_option_values_path(@option_type),
                      notice: "Option value was successfully created."
        else
          render :new
        end
      end

      # PATCH/PUT /backend/option_values/1
      def update
        if @option_value.update(option_value_params)
          redirect_to backend_option_type_option_value_path(@option_type, @option_value),
                      notice: "Option value was successfully updated."
        else
          render :edit
        end
      end

      # DELETE /backend/option_values/1
      def destroy
        @option_value.destroy
        redirect_to backend_option_type_option_values_path(@option_type),
                    notice: "Option value was successfully destroyed."
      end

      private

      def set_option_type
        @option_type = OptionType.find(params[:option_type_id])
      end

      def set_option_value
        @option_value = @option_type.option_values.find(params[:id])
      end

      def option_value_params
        params.require(:option_value).permit(:name, :presentation)
      end
    end
  end
end
