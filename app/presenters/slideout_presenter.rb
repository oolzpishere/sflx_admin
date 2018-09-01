require 'active_support/core_ext/string'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'



class SlideoutPresenter
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActiveSupport::Configurable


  config_accessor :roots, :menu_tag, :list_tag, :list_item_tag, :css, :dom_id,
                  :max_depth, :active_css, :selected_css, :first_css, :last_css, :list_tag_css,
                  :link_tag_css, :link_dropdown_tag_css, :list_tag_id, :link_dropdown_id, :dropdown_css

  self.dom_id = ''
  self.css = ''
  self.menu_tag = :nav
  self.list_tag = :ul
  self.list_tag_css = 'list-group list-group-flush '
  self.active_css = :active
  self.selected_css = :selected
  self.first_css = :first
  self.last_css = :last

  self.link_tag_css = 'list-group-item list-group-item-action waves-effect text-white'
  self.link_dropdown_id = 'navbarDropdownMenuLink'
  self.link_dropdown_tag_css = 'list-group-item list-group-item-action waves-effect text-white'
  self.dropdown_css = 'nav-item dropdown'

  attr_accessor :context, :collection
  delegate :output_buffer, :output_buffer=, :to => :context

  def initialize(collection, context)
    @collection = collection
    @context = context
  end

  def to_html
    collection && render_menu_items(collection)
  end

  private

  def render_menu_items(menu_items)
    content_tag(list_tag, :class => list_tag_css) do
      buffer = ActiveSupport::SafeBuffer.new
      menu_items.each_with_index do |item, index|
        buffer << render_menu_item(item, index)
      end
      buffer
    end
  end

  def render_menu_item(menu_item, i)
      buffer = ActiveSupport::SafeBuffer.new
      if check_for_dropdown(menu_item)
        buffer << render_dropdown_menu_item_content(menu_item, i)
      else
        buffer << render_menu_item_content(menu_item)
      end
      buffer
  end

  def check_for_dropdown(menu_item)
    menu_item.fetch(:children, nil)
  end

  def render_menu_item_content(menu)
    buffer = ActiveSupport::SafeBuffer.new
    content_tag(:li, class: link_tag_css) do
      buffer << raw("<div class='w-15 d-inline-block'><i class=\"#{menu[:fontawesome]}\"></i></div>")
      buffer << link_to(menu[:title], menu[:path], class: "text-white d-inline-block", "data-turbolinks" => menu.fetch(:data_turbolinks,nil))
      buffer
    end

  end

  def render_dropdown_menu_item_content(menu, i)
    # dropdownid = "dropdown#{menu_item.id}"

      buffer = ActiveSupport::SafeBuffer.new

      buffer << link_to( context.url_for(menu[:path]), id: link_dropdown_id, class: link_dropdown_tag_css, data: {toggle: "collapse", target: "#collapse#{i}"}, "aria-expanded" => "true", "aria-controls" => "collapse#{i}" ) do
        raw("<div class='w-15 d-inline-block'><i class=\"#{menu[:fontawesome]}\"></i></div> #{menu[:title]}")
      end

      buffer << render_dropdown_content(menu[:children], i)
      buffer

  end

  def menu_item_css(menu_item)
    css = []
    # css << active_css if descendant_item_selected?(menu_item)
    # css << selected_css if selected_item?(menu_item)
    # css << first_css if index == 0
    # css << last_css if index == menu_item.shown_siblings.length
    css.reject(&:blank?).presence
  end

  # def menu_item_children(menu_item)
  #   path  = menu_item.path
  #   if path =~ /^\/?galleries$|^\/?contact$/
  #     @collection.flatten.select { |item| item.parent == path }
  #   end
  # end

  def render_dropdown_content(menu, i)
    # dropdownid = "dropdown#{menu.first.parent}"
    content_tag(:div, id: "collapse#{i}", class: "collapse ",  "aria-labelledby" => "headingOne") do
      menu.inject(ActiveSupport::SafeBuffer.new) do |buffer, item|
        buffer << render_dropdown_menu_item(item)
      end
    end
  end

  def render_dropdown_menu_item(menu)
    _path = menu[:slideout_path] ? menu[:slideout_path] : menu[:path]
    link_to(menu[:title], context.url_for( _path ), class: "dropdown-item text-white inline-block waves-effect", "data-turbolinks" => menu[:data_turbolinks])
  end

end
