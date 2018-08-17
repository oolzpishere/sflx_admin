require "administrate/base_dashboard"

class GalleryTypeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # gallery_gallery_types: Field::HasMany,
    # galleries: Field::HasMany,
    id: Field::Number,
    gallery_type: Field::String,
    eng_name: Field::String,
    position: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :gallery_gallery_types,
    # :galleries,
    :id,
    :gallery_type,
    :eng_name,
    :position,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :gallery_gallery_types,
    # :galleries,
    :id,
    :gallery_type,
    :eng_name,
    :position,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :gallery_gallery_types,
    # :galleries,
    :gallery_type,
    :eng_name,
    :position,
  ].freeze

  # Overwrite this method to customize how gallery types are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(gallery_type)
    "Gallery type ##{gallery_type.gallery_type}"
  end
end
