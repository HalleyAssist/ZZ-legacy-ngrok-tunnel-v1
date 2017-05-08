# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ngrok-tunnel-v1/version'

Gem::Specification.new do |spec|
  spec.name          = "ngrok-tunnel-v1"
  spec.version       = NgrokV1::VERSION
  spec.authors       = ["SP TechSolutions"]
  spec.email         = ["mheard@x4b.net"]
  spec.summary       = %q{Ruby gem wrapping ngrok v1.}
  spec.description   = %q{Ruby gem wrapping ngrok v1.}
  spec.homepage      = "https://github.com/HollyAssistTeam/ngrok-tunnel-v1"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]
  spec.post_install_message = "Please ensure that the ngrok v1 binary is installed."
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
