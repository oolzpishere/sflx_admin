$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cgallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cgallery"
  s.version     = Cgallery::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = "Summary of Cgallery."
  s.description = "Description of Cgallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
