module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, unless: Proc.new { |c| c.request.format == 'application/json'}
    # This is our new function that comes before Devise's one
    # not using yet. defined below.
    # before_action :authenticate_user_from_token!, if: Proc.new { |c| c.request.format == 'application/json'}

    before_action :authenticate_user!
    # before_action :set_fields_hash, only: [:new, :edit]

    before_action :set_show_page_attributes, only: [:index]
    before_action :set_attribute_types, only: [:new, :edit]

    private
      # def set_fields_hash
      #   @fields_hash = {
      #     String: :text_field,
      #     Integer: :text_field,
      #   }
      # end
      def set_show_page_attributes
      end

      def set_attribute_types
      end

      def authenticate_user_from_token!

      end
  end
end
