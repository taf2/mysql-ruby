Gem::Specification.new do |s|
  s.name    = "mysql"
  s.authors = ["TOMITA Masahiro"]
  s.version = '2.8.1'
  s.date    = '2009-04-25'
  s.description = %q{This is the MySQL API module for Ruby. It provides the same functions for Ruby programs that the MySQL C API provides for C programs.}
  s.email   = 'todd.fisher@gmail.com'
  s.extra_rdoc_files = ['COPYING', 'COPYING.ja', 'README.html', 'README_ja.html']
  s.files = ['mysql.c', 'COPYING', 'COPYING.ja', 'README.html', 'README_ja.html', 'extconf.rb', 'mysql.gemspec.erb', 'test.rb', 'tommy.css']

  #### Load-time details
  s.require_paths = ['.']
  s.rubyforge_project = 'mysql'
  s.summary = %q{MySQL/Ruby}
  s.test_files = 'test.rb'
  s.extensions << 'extconf.rb'

  #### Documentation and testing.
  s.has_rdoc = true
  s.homepage = 'http://tmtm.org/downloads/mysql/ruby/'
  s.rdoc_options = ['--main', 'README']


  s.platform = Gem::Platform::RUBY

end
