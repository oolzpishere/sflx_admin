require_dependency "admin/application_controller"

module Admin
  class GalleryTypesController < ApplicationController
    before_action :set_gallery_type, only: [:show, :edit, :update, :destroy]

    # GET /gallery_types
    def index
      @gallery_types = Work::GalleryType.all
    end

    # GET /gallery_types/1
    def show
    end

    # GET /gallery_types/new
    def new
      @gallery_type = Work::GalleryType.new
    end

    # GET /gallery_types/1/edit
    def edit
    end

    # POST /gallery_types
    def create
      @gallery_type = Work::GalleryType.new(gallery_type_params)

      if @gallery_type.save
        redirect_to @gallery_type, notice: 'Gallery type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /gallery_types/1
    def update
      if @gallery_type.update(gallery_type_params)
        redirect_to @gallery_type, notice: 'Gallery type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /gallery_types/1
    def destroy
      @gallery_type.destroy
      redirect_to gallery_types_url, notice: 'Gallery type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gallery_type
        @gallery_type = Work::GalleryType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def gallery_type_params
        params.fetch(:gallery_type, {}).permit(:id,
                  :gallery_type,
                  :position,
                  :eng_name)
      end

      def set_show_page_attributes
        @show_page_attributes = [
          :id,
          :gallery_type,
          :position,
          :eng_name,
        ]
      end

      def set_attribute_types
        @attribute_types = {
          # id: "Field::String",
          gallery_type: "Field::String",
          position: "Field::String",
          eng_name: "Field::String",
        }
      end
  end
end
