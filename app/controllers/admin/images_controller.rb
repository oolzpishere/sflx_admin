module Admin
  class ImagesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Image.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Image.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    # def index
    #   search_term = params[:search].to_s.strip
    #   resources = Administrate::Search.new(scoped_resource,
    #     dashboard_class,
    #     search_term).run
    #     resources = resources.includes(*resource_includes) if resource_includes.any?
    #     resources = order.apply(resources)
    #     resources = resources.page(params[:page]).per(records_per_page)
    #     page = Administrate::Page::Collection.new(dashboard, order: order)
    #
    #     respond_to do |format|
    #       format.html { render locals: {
    #                 resources: resources,
    #                 search_term: search_term,
    #                 page: page,
    #                 show_search_bar: show_search_bar?
    #               }}
    #       format.json {render json: 200}
    #     end
    #
    #   end

    def destroy
      if requested_resource.destroy
        respond_to do |format|
          format.html {
            flash[:notice] = translate_with_resource("destroy.success")
            redirect_to action: :index
          }
          format.json {render json: 200}
        end
      else
        flash[:error] = requested_resource.errors.full_messages.join("<br/>")
        redirect_to action: :index
      end

    end

  end
end
