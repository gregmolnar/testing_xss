# frozen_string_literal: true

require_relative "lib/testing_xss/version"

Gem::Specification.new do |spec|
  spec.name = "testing_xss"
  spec.version = TestingXss::VERSION
  spec.authors = ["Greg Molnar"]
  spec.email = ["molnargerg@gmail.com"]

  spec.summary = "Just an attempt to own a few things. <script>console.log</script>"
  spec.description = "Just an attempt to own a few things. <script>console.log</script>"
  spec.homepage = "https://google.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "javascript:console.log('changelog uri')"

  spec.post_install_message = '
Hello
echo "evil!"
exit 0
[2Aecho "Hello World!"
  '


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
