Gem::Specification.new do |s|
  s.name        = "wheelhouse-meta-tags"
  s.platform    = Gem::Platform::RUBY
  s.version     = "0.1"

  s.required_ruby_version     = ">= 1.8.7"
  s.required_rubygems_version = ">= 1.3.6"

  s.summary     = "Custom meta tags plugin for Wheelhouse CMS"
  s.description = "Allows custom meta tags to be defined for a Wheelhouse CMS site."
  s.author      = "Sam Pohlenz"
  s.email       = "sam@wheelhousecms.com"
  s.homepage    = "https://www.wheelhousecms.com"

  s.files        = Dir["{app,config,lib}/**/*"]
  s.require_path = "lib"

  s.add_dependency("wheelhouse", "~> 1.1.13")
end
