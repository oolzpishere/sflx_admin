# coding: utf-8
module ApplicationHelper
  # attr_accessor :mbuffer
  def m_arr
    [{:path => 'index', :title => '主页'},
     {:path => 'about',:title => '关于'},
     {:path =>'galleries',:title => '作品'},
     {:path =>'views',:title => '观点'},
     [{:path =>'contact',:title => '联系我们'}, {:path =>'contact/find_us',:title => '找到我们', :parent => 'contact'}]]
  end

  @index = 0 

  def add_lr(menus, child: 'false')
    first, *rest = menus
    if first.is_a?(Array)
      add_lr(first, child: 'true')
    elsif first.is_a?(Menu) && child == 'false'
      first.lft = addone
      first.rgt = addone
      add_lr(rest)
    elsif first.is_a?(Menu) && child == 'true'
      first.lft = addone
      add_lr(rest)
      first.rgt = addone
    end
    menus
  end

  # m_arr.each

  def addone
    @index += 1
  end

  def add_lr_to_struct(data)
    data.each {|item| add_lr item}
    
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

  # Menu = Struct.new( :path, :title, :lft, :rgt, :rest ) do
  #   def self.from_array(nested_list)
  #     item, *rest = nested_list
  #     if item
  #       self.new(item[:path], item[:title],  0,  0, self.from_array(rest))
  #     end

  #   end
  # end

  Menu = Struct.new( :path, :title, :parent, :lft, :rgt)
  
  def menulize(item)
    Menu.new( item[:path], item[:title], item[:parent], 0, 0 ) 
  end

  private
  # def mloop(menu_arr, prefix)
  #   menu_arr.each do |m|
  #     if m.is_a(Array)
  #       mloop m, prefix
  #     elsif m.is_a(String)
  #       m.shift
  #       prefix.push m
  #       prefix.join("/")
  #     end
  #   end
  # end
  
end
