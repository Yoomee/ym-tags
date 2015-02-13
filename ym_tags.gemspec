$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_tags"
  s.version     = YmTags::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Si Wilkins"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "si@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "Summary of YmTags."
  s.description = "Description of YmTags."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'ym_core', "~> 1.0"
  s.add_dependency "acts-as-taggable-on", "~> 3.0"
  s.add_dependency 'rails3-jquery-autocomplete'
  
  s.add_development_dependency "geminabox"
  s.add_development_dependency "ym_tools", '~> 1.0'
  
end


