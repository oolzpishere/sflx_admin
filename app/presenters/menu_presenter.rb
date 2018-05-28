require 'active_support/core_ext/string'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'



class MenuPresenter
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
  self.list_tag_css = 'navbar-nav mr-auto'
  self.active_css = :active
  self.selected_css = :selected
  self.first_css = :first
  self.last_css = :last

  self.link_tag_css = 'nav-link'
  self.link_dropdown_id = 'navbarDropdownMenuLink'
  self.link_dropdown_tag_css = 'nav-link dropdown-toggle'
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
      menu_items.inject(ActiveSupport::SafeBuffer.new) do |buffer, item|
        buffer << render_menu_item(item)
      end
    end
  end

  def render_menu_item(menu_item)
      buffer = ActiveSupport::SafeBuffer.new
      if check_for_dropdown(menu_item)
        buffer << render_dropdown_menu_item_content(menu_item)
      else
        buffer << render_menu_item_content(menu_item)
      end
      buffer
  end

  def check_for_dropdown(menu_item)
    menu_item.fetch(:children, nil)
  end

  def render_menu_item_content(menu)
    content_tag(:li, :class => 'nav-item') do
      link_to(menu[:title], context.url_for(menu[:path]), :class => link_tag_css, "data-turbolinks" => menu.fetch(:data_turbolinks,nil))
    end
  end

  def render_dropdown_menu_item_content(menu)
    # dropdownid = "dropdown#{menu_item.id}"
    content_tag(:li, class: dropdown_css) do
      buffer = ActiveSupport::SafeBuffer.new
      buffer << link_to( menu[:title], context.url_for(menu[:path]), id: link_dropdown_id, class: link_dropdown_tag_css, 'aria-haspopup'=> "true", 'aria-expanded' => "false", data: {toggle: "dropdown"} )
      buffer << render_dropdown_content(menu[:children])
      buffer
    end
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

  def render_dropdown_content(menu)
    # dropdownid = "dropdown#{menu.first.parent}"
    content_tag(:div, class: "dropdown-menu dropdown-primary",  "aria-labelledby" => "navbarDropdownMenuLink") do
      menu.inject(ActiveSupport::SafeBuffer.new) do |buffer, item|
        buffer << render_dropdown_menu_item(item)
      end
    end
  end

  def render_dropdown_menu_item(menu)
    link_to(menu[:title], context.url_for(menu[:path]), class: "dropdown-item", "data-turbolinks" => menu[:data_turbolinks])
  end

end
