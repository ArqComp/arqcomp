Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-updates'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Updates engine for Refinery CMS'
  s.date              = '2011-10-17'
  s.summary           = 'Updates engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
