# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wildsearcher/version'

Gem::Specification.new do |spec|
  spec.name          = "wildsearcher"
  spec.version       = Wildsearcher::VERSION
  spec.authors       = ["Vivek Bisen"]
  spec.email         = ["vivek@luther.edu"]

  spec.summary       = %q{Provide a way to search a term for specific fields}
  spec.homepage      = "https://github.com/vivekbisen/wildsearcher"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activerecord", ">= 3", "< 5.1"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.files = %w(
    lib/wildsearcher.rb
    lib/wildsearcher/active_record.rb
    LICENSE.txt
    README.md
  )
end
