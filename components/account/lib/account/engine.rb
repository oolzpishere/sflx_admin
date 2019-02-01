module Account
  class Engine < ::Rails::Engine
    isolate_namespace Account

    initializer 'work.append_migrations' do |app|
      unless app.root.to_s == root.to_s
        config.paths["db/migrate"].expanded.each do |path|
          app.config.paths["db/migrate"].push(path)
        end
      end
    end

    initializer 'work.asset_precompile_paths' do |app|
      # app.config.assets.precompile += ["account/manifests/*"]
    end

  end
end
