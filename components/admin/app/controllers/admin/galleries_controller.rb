require_dependency "admin/application_controller"

module Admin
  class GalleriesController < ApplicationController
    before_action :set_gallery, only: [:show, :edit, :update, :destroy]


    # GET /galleries
    def index
      @galleries = Work::Gallery.all
    end

    # GET /galleries/1
    def show
      respond_to do |format|
        format.html {}
        format.json {render json: @gallery.images.reorder('id ASC').map {|img| img.to_jq_upload}}
      end
      # format.html { render locals: {
      #   page: Administrate::Page::Show.new(dashboard, requested_resource),
      # }}
    end

    # GET /galleries/new
    def new
      @gallery = Work::Gallery.new
    end

    # GET /galleries/1/edit
    def edit
      # byebug
    end

    # POST /galleries
    def create
      # not actually delete, return nil if not exist
      images = gallery_params.delete(:images)
      @gallery = Work::Gallery.new(gallery_params.except(:images))
      # authorize_resource(@gallery)

      if @gallery.save
        created_images = images && images.map do |picture|
          resource.images.create!(:image => picture)
        end
        respond_to do |format|
          format.html {
            redirect_to @gallery, notice: 'Gallery was successfully created.'
          }
          format.json {
            render json: created_images.map {|img| img.to_jq_upload}
          }
        end
      else
        render :new
      end
    end

    # PATCH/PUT /galleries/1
    def update
      # not actually delete, return nil if not exist
      images = gallery_params.delete(:images)

      if @gallery.update(gallery_params.except(:images))
        created_images = images && images.map do |picture|
          @gallery.images.create!(:image => picture)
        end
        respond_to do |format|
          format.html {
            redirect_to @gallery, notice: 'Gallery was successfully updated.'
          }
          format.json {
            render json: created_images.map {|img| img.to_jq_upload}
          }
        end

      else
        render :edit
      end
    end

    # DELETE /galleries/1
    def destroy
      @gallery.destroy
      redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gallery
        @gallery = Work::Gallery.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def gallery_params
        params.fetch(:gallery, {}).permit(:id, :title, :body, :side_body, :position, :cover, :first_img, images: [])
      end

      def set_show_page_attributes
        @show_page_attributes = [
          :id,
          :title,
          :position,
          :updated_at,
        ]
      end

      def set_attribute_types
        @attribute_types = {
          title: "Field::String",
          body: "Field::String",
          side_body: "Field::String",
          position: "Field::String",
          cover: "Field::String",
          first_img: "Field::String",
        }
      end

  end
end
