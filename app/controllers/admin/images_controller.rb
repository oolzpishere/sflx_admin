module Admin
  class WorkImagesController < Admin::ApplicationController


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
