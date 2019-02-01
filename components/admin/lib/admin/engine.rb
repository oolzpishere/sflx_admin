require "admin/field"

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    config.to_prepare do
      DeviseController.layout "admin/for_devise"
    end
  end
end
