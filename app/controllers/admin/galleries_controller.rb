module Admin
  class GalleriesController < Admin::ApplicationController
    # skip_before_action :authenticate_user!, only: [:edit], if: Proc.new { |c| c.request.format != 'application/json'}

    def show
      respond_to do |format|
        format.html { render locals: {
          page: Administrate::Page::Show.new(dashboard, requested_resource),
        }}
        format.json {render json: requested_resource.images.reorder('id ASC').map {|img| img.to_jq_upload}}
      end

    end

    # def edit
    #   respond_to do |format|
    #     format.html { render locals: { page: Administrate::Page::Form.new(dashboard, requested_resource)}}
    #     format.json {render json: requested_resource.images.map {|img| img.to_jq_upload}}
    #   end
    # end

    def create
      # not actually delete, return nil if not exist
      images = resource_params.delete(:images)
      resource = resource_class.new(resource_params.except(:images))
      authorize_resource(resource)

      if resource.save
        images && images.each do |picture|
          resource.images.create(:image => picture)
          # Don't forget to mention :avatar(field name)
        end
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end

    def update
      # not actually delete, return nil if not exist
      images = resource_params.delete(:images)
      if requested_resource.update(resource_params.except(:images))
        created_images = []
        images && images.each do |picture|
          created_images << requested_resource.images.create(:image => picture)
          # Don't forget to mention :avatar(field name)
        end
        respond_to do |format|
          format.html {
            redirect_to(
              [namespace, requested_resource],
              notice: translate_with_resource("update.success"),
            )
          }

          format.json {
            render json: created_images.map {|img| img.to_jq_upload}
          }
        end
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Gallery.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Gallery.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
