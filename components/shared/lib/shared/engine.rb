module Shared
  class Engine < ::Rails::Engine
    isolate_namespace Shared

    initializer 'shared.asset_precompile_paths' do |app|
      # app.config.assets.precompile += ["shared/manifests/*"]
      app.config.assets.precompile += ["shared/manifests/application"]
      app.config.assets.precompile += ["shared/manifests/custom.js"]
    end
  end
end
