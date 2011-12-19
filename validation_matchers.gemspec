require 'rubygems'

SPEC = Gem::Specification.new do |s|
  s.name = "validation_matchers"
  s.version = '0.1.0'
  s.author = "Adrian Mowat, Peter Aitken"
  s.homepage = "https://github.com/edgecase/validation_matchers"
  s.summary = "RSpec matchers for testing ActiveModel custom validations"
  s.description = <<EOS
RSpec matchers for testing ActiveModel custom validations in isolation 
from your application's models
EOS
  s.has_rdoc = false
  
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
