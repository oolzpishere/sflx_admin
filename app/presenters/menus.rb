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
      # {:path => '/', :title => '主页', fontawesome: "fas fa-home"},
      {:path =>'/galleries',:title => '设计服务', fontawesome: "fas fa-palette", data_turbolinks: false,
        children: [
          {:path => '/galleries?gallery_type=all', :slideout_path => '/galleries',:title => '全部作品', fontawesome: "fas fa-info-circle"},
          {:path => '/galleries?gallery_type=logo',:title => 'LOGO', fontawesome: "fas fa-info-circle"},
          {:path => '/galleries?gallery_type=vi',:title => 'VI设计', fontawesome: "fas fa-info-circle"},
          {:path => '/galleries?gallery_type=album',:title => '画册设计', fontawesome: "fas fa-info-circle"},
          {:path => '/galleries?gallery_type=packaging',:title => '包装设计', fontawesome: "fas fa-info-circle"},
        ]},
      {:path =>'/conference',:title => '会议会展', fontawesome: "fas fa-microphone-alt", data_turbolinks: false },
      {:path =>'/web',:title => '网络技术', fontawesome: "fas fa-sitemap", data_turbolinks: false},
      {:path => '/contact',:title => '联系我们', fontawesome: "fas fa-info-circle", data_turbolinks: false},
        # {:path => '/us',:title => '我们', fontawesome: "fas fa-info-circle",
        #   children: [
        #     {:path => '/about',:title => '关于', fontawesome: "fas fa-info-circle"},
        #     {:path =>'/contact',:title => '联系我们', fontawesome: "fas fa-info-circle",  data_turbolinks: false}
        #   ]}
      # {:path =>'/contact',:title => '联系我们',
      #   children: [{:path =>'/contact/find_us',:title => '找到我们', :parent => 'contact', data_turbolinks: true}]
      # }
    ]
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
  # def order_path(structs = menu_array)
  #   structs.map { |struct|
  #     if struct.is_a?(Array)
  #       order_path struct
  #     else
  #       struct[:path]
  #     end
  #   }
  # end
  #
  # def pages_show
  #   order_path.flatten.reject { |item| RES.any? { |res| item.match(/#{res}/) } }
  # end


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
