require_dependency "admin/application_controller"

module Admin
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    # GET /images
    def index
      @images = Image.all
    end

    # GET /images/1
    def show
    end

    # GET /images/new
    def new
      @image = Image.new
    end

    # GET /images/1/edit
    def edit
    end

    # POST /images
    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to @image, notice: 'Image was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        redirect_to @image, notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /images/1
    def destroy


      if @image.destroy
        respond_to do |format|
          format.html {
            redirect_to admin.root_url, notice: 'Image was successfully destroyed.'
          }
          format.json {render json: 200}
        end
      else
        # redirect_to action: :index
      end

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Work::Image.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.fetch(:image, {})
      end
  end
end
