module Shared
  class Engine < ::Rails::Engine
    isolate_namespace Shared

    initializer 'shared.asset_precompile_paths' do |app|
      # app.config.assets.precompile += ["shared/manifests/*"]
      app.config.assets.precompile += ["shared/manifests/application"]
      app.config.assets.precompile += ["shared/manifests/custom.js"]
      app.config.assets.precompile += ["shared/manifests/galleries.js"]
      app.config.assets.precompile += ["shared/manifests/site.js"]
      app.config.assets.precompile += ["shared/manifests/slick.js"]
      app.config.assets.precompile += ["shared/manifests/turbolink_initialize.js"]

    end
  end
end
