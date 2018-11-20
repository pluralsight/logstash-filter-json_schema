Gem::Specification.new do |s|
  s.name          = 'logstash-filter-json_schema'
  s.version       = '0.3.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'Validates json input against a provided schema (https://json-schema.org)'
  s.homepage      = 'https://github.com/pluralsight/logstash-filter-json_schema'
  s.authors       = ['Neil Sorensen', 'Kay Johansen']
  s.email         = 'neil-sorensen@pluralsight.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_runtime_dependency "json-schema", "~> 2.6"
  s.add_development_dependency 'logstash-devutils'
end
