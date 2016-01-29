# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/consul/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano3-consul'
  spec.version       = Capistrano::Consul::VERSION
  spec.authors       = ['Jose Fernandez (magec)']
  spec.email         = ['joseferper@gmail.com']

  spec.summary       = 'Plugin to use a consul server/cluster to define capistrano servers.'
  spec.description   = 'This plugin allow using a consul server to automatically set up servers.'
  spec.homepage      = 'https://github.com/magec/capistrano3-consul'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.1'
  spec.add_dependency 'diplomat', '~> 0.15.0'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
