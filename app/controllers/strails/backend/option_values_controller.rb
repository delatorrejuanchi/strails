# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class OptionValuesController < BackendController
      before_action :set_option_type
      before_action :set_option_value, only: %i[show edit update destroy]

      def index
        @option_values = @option_type.option_values
      end

      def show
        redirect_to edit_backend_option_type_option_value_path(@option_type, @option_value)
      end

      def new
        @option_value = @option_type.option_values.build
      end

      def edit; end

      def create
        @option_value = @option_type.option_values.build(option_value_params)

        if @option_value.save
          redirect_to backend_option_type_option_values_path(@option_type),
                      notice: t("successfully_created", model_name: translated_model_name("option_value"))
        else
          render :new
        end
      end

      def update
        if @option_value.update(option_value_params)
          redirect_to backend_option_type_option_value_path(@option_type, @option_value),
                      notice: t("successfully_updated", model_name: translated_model_name("option_value"))
        else
          render :edit
        end
      end

      def destroy
        if @option_value.destroy
          redirect_to backend_option_type_option_values_path(@option_type),
                      notice: t("successfully_destroyed", model_name: translated_model_name("option_value"))
        else
          redirect_to backend_option_type_option_value_path(@option_type, @option_value),
                      error: t("errors.could_not_destroy", model_name: translated_model_name("option_value"))
        end
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
