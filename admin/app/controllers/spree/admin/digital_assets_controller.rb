module Spree
  module Admin
    class DigitalAssetsController < ResourceController
      belongs_to 'spree/product', find_by: :slug

      private

      def model_class
        Spree::Digital
      end

      def collection
        parent.digitals
      end

      def collection_url
        spree.admin_product_digital_assets_path(parent)
      end

      def build_resource
        parent.digitals.build
      end

      def find_resource
        parent.digitals.find(params[:id])
      end

      def create_turbo_stream_enabled?
        @object.errors.any?
      end

      def update_turbo_stream_enabled?
        @object.errors.any?
      end

      def location_after_save
        spree.admin_product_digital_assets_path(parent)
      end

      def permitted_resource_params
        params.require(:digital_asset).permit(permitted_digital_attributes)
      end
    end
  end
end
