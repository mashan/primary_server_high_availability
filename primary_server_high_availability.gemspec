# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'primary_server_high_availability/version'

Gem::Specification.new do |spec|
  spec.name          = "primary_server_high_availability"
  spec.version       = PrimaryServerHighAvailability::VERSION
  spec.authors       = ["mashan"]
  spec.email         = ["masakazusaito94@gmail.com"]
  spec.description   = %q{A monitoring and failover tool.}
  spec.summary       = %q{A monitoring and failover tool.}
  spec.homepage      = "https://github.com/mashan/primary_server_high_availability"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "net-ping"
end
