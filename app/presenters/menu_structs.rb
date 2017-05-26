# coding: utf-8
class MenuStructs
  # attr_accessor :mbuffer

  def initialize
    
  end
  
  def m_arr
    [{:path => 'index', :title => '主页'},
     {:path => 'about',:title => '关于'},
     {:path =>'galleries',:title => '作品'},
     {:path =>'views',:title => '观点'},
     [{:path =>'contact',:title => '联系我们', :parent => 'self'}, {:path =>'contact/find_us',:title => '找到我们', :parent => 'contact'}]]
  end

  def add_lr_to_struct
    @index = 0
    add_lr menu_struct_arr
  end

  def add_lr(menus)
    first, *rest = menus
    if first.is_a?(Array)
      add_lr(first)
    elsif first.is_a?(Menu)
      first.lft = addone
      add_lr(rest) unless first.parent.nil?
      first.rgt = addone
      add_lr(rest) if  first.parent.nil?
    end
    menus
  end

  def addone
    @index += 1
  end

  def menu_struct_arr( menu_arr: m_arr )
    menu_arr.map do |m|
      if m.is_a?(Hash)
        m = menulize(m)
      elsif m.is_a?(Array)
        menu_struct_arr( menu_arr: m)
      end
    end
  end

  Menu = Struct.new( :path, :title, :parent, :lft, :rgt)

  def menulize(item)
    Menu.new( item[:path], item[:title], item[:parent]) 
  end

  
  
end
