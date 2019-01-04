$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "frontend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "frontend"
  s.version     = Frontend::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = "Summary of Frontend."
  s.description = "Description of Frontend."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
