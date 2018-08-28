require "administrate/base_dashboard"

class GalleryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    title_eng: Field::String,
    body: Field::Text,
    side_body: Field::Text,
    gallery_types: Field::HasMany,
  #   .with_options(
  #   # primary_key: :gallery_type,
  #   foreign_key: :gallery_type_id,
  # ),
    position: Field::Number,
  #   avatars: Field::Carrierwave.with_options(
  #   image: :standard,
  #   multiple: true,
  #   image_on_index: true,
  #   remove: true,
  #   remote_url: false
  # ),
  # images: Field::Paperclip,
  cover: Field::String,
  first_img: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :title_eng,
    :body,
    :side_body,
    :gallery_types,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :title_eng,
    :body,
    :side_body,
    :gallery_types,
    :position,
    :cover,
    :first_img,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :title_eng,
    :body,
    :side_body,
    :position,
    :gallery_types,
    :cover,
    :first_img,
    # :images,
    # :avatars,
  ].freeze

  # Overwrite this method to customize how galleries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(gallery)
  #   "Gallery ##{gallery.id}"
  # end

  # def association_includes
  #   super(association_classes.merge [ImageField])
  # end

  # If multiple: true
  def permitted_attributes
    super + [:remove_avatars] - [:avatars] + [{ avatars: [] }] - [:images] + [{images: []}] + [:image]
  end
end
