# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mandrill_letter_opener/version'

Gem::Specification.new do |spec|
  spec.name          = "mandrill_letter_opener"
  spec.version       = MandrillLetterOpener::VERSION
  spec.authors       = %w[Rodik Viktor]
  spec.email         = %w[i6@bk.ru 30avenyamadeo@gmail.com]

  spec.summary       = %q{Mandrill and LetterOpener connector}
  spec.description   = %q{Opens emails sent with Mandrill in LetterOpener}
  spec.homepage      = "https://github.com/Rezonans/mandrill_letter_opener"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "mandrill_mailer", "~> 1.8.0"
  spec.add_dependency "letter_opener", "~> 1.7.0"
end
