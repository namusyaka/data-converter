require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new "botch", DataConverter::VERSION do |s|
  s.summary          = "Convert hash and array into HTML Element."
  s.description      = "Convert hash and array into HTML Element."
  s.authors          = ["namusyaka"]
  s.email            = "namusyaka@gmail.com"
  s.homepage         = "https://github.com/namusyaka/data-converter"
  s.files            = `git ls-files`.split("\n") - %w(.gitignore)
  s.test_files       = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
  s.license          = "MIT"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-html-matchers"
end
