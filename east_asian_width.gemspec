Gem::Specification.new do |s|
  s.name        = 'east_asian_width'
  s.version     = '0.0.2'
  s.summary     = 'East Asian Width'
  s.description = 'Get East Asian Width from a character.'
  s.authors     = ['Kaizhao Zhang']
  s.email       = 'zhangkaizhao@gmail.com'
  s.files       = ['README.md', 'Rakefile', 'lib/east_asian_width.rb', 'test/test_east_asian_width.rb']
  s.homepage    = 'https://github.com/zhangkaizhao/east_asian_width'
  s.license     = 'MIT'

  s.add_development_dependency 'minitest', '~> 5.10'
  s.add_development_dependency 'rake', '~> 12.3'
end
