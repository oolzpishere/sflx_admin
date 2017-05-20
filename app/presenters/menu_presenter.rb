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
                  :link_tag_css, :link_dropdown_tag_css, :list_item_opt_tag, :list_item_opt, :list_tag_id

  self.dom_id = ''
  self.css = ''
  self.menu_tag = :nav
  self.list_tag = :ul
  self.list_item_tag = :li
  self.active_css = :active
  self.selected_css = :selected
  self.first_css = :first
  self.last_css = :last
  self.list_tag_css = 'right hide-on-med-and-down'
  self.link_tag_css = 'waves-effect waves-light'
  self.link_dropdown_tag_css = 'header-dropdown-button waves-effect waves-light'


  attr_accessor :context, :collection
  delegate :output_buffer, :output_buffer=, :to => :context

  def initialize(collection, context)
    @collection = collection
    @context = context
  end

  def to_html
    render_menu_items(collection) if collection.present?
  end

  def render_menu_items(menu_items)
    if menu_items.present? 
      content_tag(list_tag, :id => list_tag_id, :class => list_tag_css) do
        menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
          buffer << render_menu_item(item, index)
        end
      end
    end
  end

  private

  def render_menu_item(menu_item, index)
    content_tag(list_item_tag, :class => menu_item_css(menu_item, index), list_item_opt_tag => list_item_opt) do
      buffer = ActiveSupport::SafeBuffer.new
      
      if check_for_dropdown_item(menu_item)
        buffer << render_menu_item_link_dropdown(menu_item)
      else
        buffer << render_menu_item_link(menu_item)
      end 

      buffer << render_menu_items_children(menu_item_children(menu_item))

      buffer
    end
  end

  def check_for_dropdown_item(menu_item)
    menu_item.is_a?(Array)
  end

  def render_menu_item_link(menu_item)
    path = get_path menu_item
    turbolinks_boolean = path =~ /find_us/ ? false : true
    link_to(menu_item.title, path, :class => link_tag_css, "data-turbolinks" => turbolinks_boolean)
  end

  def render_menu_item_link_dropdown(menu_item)
    dropdownid = "dropdown#{menu_item.id}"
    path = get_path menu_item
    
    link_to( context.url_for(path), :class => link_dropdown_tag_css, data: {activates: dropdownid} ) do
      str = "#{menu_item.title}<i class=\"fa fa-chevron-down right\" aria-hidden=\"true\"></i>"
      str.html_safe
    end
  end

  def menu_item_css(menu_item, index)
    css = []

    # css << active_css if descendant_item_selected?(menu_item)
    # css << selected_css if selected_item?(menu_item)
    css << first_css if index == 0
    # css << last_css if index == menu_item.shown_siblings.length

    css.reject(&:blank?).presence
  end

  def menu_item_children(menu_item)
    path = get_path menu_item 
    if path =~ /^\/?galleries$|^\/?contact$/
      @collection.select { |item| item.parent_id == menu_item.id }
    end
  end

  def render_menu_items_children(menu_items)
    if menu_items.present?
      dropdownid = "dropdown#{menu_items.first.parent_id}"
      content_tag(list_tag, :id => dropdownid, :class => 'dropdown-content') do
        menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
          buffer << render_menu_item(item, index)
        end
      end
    end
  end
  

end

