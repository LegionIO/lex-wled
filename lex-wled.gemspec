require_relative 'lib/legion/extensions/wled/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-wled'
  spec.version       = Legion::Extensions::Wled::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::WLED'
  spec.description   = 'LEX::WLED'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-wled'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-wled'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270110'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614858767'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-wled/issues'
  spec.require_paths = ['lib']
end
