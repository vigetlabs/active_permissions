# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_permissions/version'

Gem::Specification.new do |spec|
  spec.name          = "active_permissions"
  spec.version       = ActivePermissions::VERSION
  spec.authors       = ["Eli Fatsi"]
  spec.email         = ["eli.fatsi@viget.com"]

  spec.summary       = "Plug in Permissions System for Active Admin"
  spec.homepage      = "https://github.com/vigetlabs/active_permissions"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "activeadmin", "~> 1.0.0.pre1"
end
