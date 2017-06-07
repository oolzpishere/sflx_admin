# coding: utf-8
class MenuStructs
  # attr_accessor :mbuffer
  Menu = Struct.new( :path, :title, :parent, :lft, :rgt)

  def initialize
    
  end
  
  ARR = 
    [{:path => 'index', :title => '主页'},
     {:path => 'about',:title => '关于'},
     {:path =>'galleries',:title => '作品'},
     {:path =>'views',:title => '观点'},
     [{:path =>'contact',:title => '联系我们', :parent => 'self'},
      {:path =>'contact/find_us',:title => '找到我们', :parent => 'contact'}]]

  RES = ['galleries']

  def order
    @index = 0
    add_lr( menus: array_menulize)
  end

  def order_path(structs = order)
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

  def add_lr( menus: [])
    first, *rest = menus
    if first.is_a?(Array)
      add_lr(menus: first)
    elsif first.is_a?(Menu)
      first.lft = @index += 1
      add_lr(menus: rest) unless first.parent.nil?
      first.rgt = @index += 1
      add_lr(menus: rest) if  first.parent.nil?
    end
    menus
  end

  def array_menulize( menu_arr: ARR )
    menu_arr.map do |m|
      if m.is_a?(Hash)
        m = menulize(m)
      elsif m.is_a?(Array)
        array_menulize( menu_arr: m)
      end
    end
  end

  
  def menulize(item)
    menulized = Menu.new( item[:path], item[:title], item[:parent])
    menulized
  end

end
