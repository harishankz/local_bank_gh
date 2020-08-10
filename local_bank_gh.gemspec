
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "local_bank_gh/version"

Gem::Specification.new do |spec|
  spec.name          = "local_bank_gh"
  spec.version       = LocalBankGh::VERSION
  spec.authors       = ["Hari Shankar Gurusamy"]
  spec.email         = ["harishankx@gmail.com"]

  spec.summary       = %q{This is wrapper gem for assignment.}
  spec.description   = %q{This gem covers user's and their roles creation.}
  spec.homepage      = "https://github.com/harishankz/local_bank_gh"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'http://mygemserver.com'

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/harishankz/local_bank_gh"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', '~> 6.0', '6.0.0'
  spec.add_runtime_dependency 'activerecord', '~> 6.0', '6.0.0'
  spec.add_runtime_dependency 'mysql2', '~> 0.5', ">= 0.5.1"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'cancancan', '~> 3.1'
  spec.add_development_dependency 'shoulda', '~> 3.5.0', ">= 3.5"
  spec.add_development_dependency 'pry', '~> 0.11', ">= 0.11.3"

  spec.test_files = Dir["spec/**/*"]

  spec.required_ruby_version = ">= 2.6.3"
end
