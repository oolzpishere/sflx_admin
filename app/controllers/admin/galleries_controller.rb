module Admin
  class GalleriesController < Admin::ApplicationController

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
        images && images.each do |picture|
          requested_resource.images.create(:image => picture)
          # Don't forget to mention :avatar(field name)
        end
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
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
