# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class OptionTypesController < BackendController
      before_action :set_option_type, only: %i[show edit update destroy]

      def index
        @option_types = OptionType.all
      end

      def show
        redirect_to edit_backend_option_type_path(@option_type)
      end

      def new
        @option_type = OptionType.new
      end

      def edit; end

      def create
        @option_type = OptionType.new(option_type_params)

        if @option_type.save
          redirect_to backend_option_type_path(@option_type),
                      notice: t("successfully_created", model_name: translated_model_name("option_type"))
        else
          render :new
        end
      end

      def update
        if @option_type.update(option_type_params)
          redirect_to backend_option_type_path(@option_type),
                      notice: t("successfully_updated", model_name: translated_model_name("option_type"))
        else
          render :edit
        end
      end

      def destroy
        if @option_type.destroy
          redirect_to backend_option_types_path,
                      notice: t("successfully_destroyed", model_name: translated_model_name("option_type"))
        else
          redirect_to backend_option_type_path(@option_type),
                      error: t("errors.could_not_destroy", model_name: translated_model_name("option_type"))
        end
      end

      private

      def set_option_type
        @option_type = OptionType.find(params[:id])
      end

      def option_type_params
        params.require(:option_type).permit(:name, :presentation,
                                            option_values_attributes: %i[id name presentation _destroy])
      end
    end
  end
end
