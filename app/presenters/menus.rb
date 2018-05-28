require 'ostruct'
require 'json'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'
class Menus
  include ActionView::Helpers::TagHelper
include ActionView::Helpers::UrlHelper
include ActiveSupport::Configurable
  attr_accessor :menu_array

  def initialize

    # @menu_array = [
    #   {:path => 'index', :title => '主页'},
    #   {:path => 'about',:title => '关于'},
    #   {:path =>'galleries',:title => '作品'},
    #   {:path =>'views',:title => '观点'},
    #   [{:path =>'contact',:title => '联系我们', dropdown: true, :parent => 'self'},
    #     {:path =>'contact/find_us',:title => '找到我们', :parent => 'contact'}]]

    @menu_array = [
      {:path => 'index', :title => '主页'},
      {:path => 'about',:title => '关于'},
      {:path =>'galleries',:title => '作品', children: gallery_types},
      {:path =>'views',:title => '观点'},
      {:path =>'contact',:title => '联系我们',
        children: [{:path =>'contact/find_us',:title => '找到我们', :parent => 'contact', data_turbolinks: true}]
      }]
    # @menu_array = array_menulize( @menu_array )

  end

  def gallery_types
    GalleryType.all.map do |gt|
      # return all string Hash
      gt = gt.attributes
      gallery_type = gt["gallery_type"]
      query = {gallery_type: gallery_type}.to_query
      gt[:title] = gallery_type
      gt[:path] = '/galleries?' + query
      gt
    end
  end

  RES = ['galleries']


  # def order
  #   @index = 0
  #   add_lr( menus: array_menulize)
  # end
  #
  def order_path(structs = menu_array)
    structs.map { |struct|
      if struct.is_a?(Array)
        order_path struct
      else
        struct.path
      end
    }
  end

  def pages_show
    order_path.flatten.reject { |item| RES.any? { |res| item.match(/#{res}/) } }
  end


  private

  # def array_menulize( menu_array )
  #   menu_array.map do |m|
  #     if m[:children]
  #       m[:children] = array_menulize(m[:children])
  #     end
  #     menulize(m)
  #   end
  # end
  #
  # def menulize(item)
  #   OpenStruct.new(item)
  # end

end
