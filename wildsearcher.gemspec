# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wildsearcher/version'

Gem::Specification.new do |spec|
  spec.name          = "wildsearcher"
  spec.description   = "Filter your records for your rails app with one line change."
  spec.version       = Wildsearcher::VERSION
  spec.authors       = ["Vivek Bisen"]
  spec.email         = ["vivek@luther.edu"]

  spec.summary       = %q{Provide a way to search a term for specified fields}
  spec.homepage      = "https://github.com/vivekbisen/wildsearcher"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "rspec", "~> 3.4"

  spec.add_dependency "activerecord", ">= 3.0"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.files = %w(
    lib/wildsearcher.rb
    LICENSE.txt
    README.md
  )
end
