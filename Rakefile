require 'rake/clean'

CURRENT_VERSION='2.8.1'
MYSQL_SO = "mysql.#{Config::MAKEFILE_CONFIG['DLEXT']}"
MAKECMD = ENV['MAKE_CMD'] || 'make'
MAKEOPTS = ENV['MAKE_OPTS'] || ''
CLEAN.include '*.o'
CLEAN.include "*.#{Config::MAKEFILE_CONFIG['DLEXT']}"
CLOBBER.include '*.log'
CLOBBER.include 'Makefile'
CLOBBER.include 'error_const.h'
CLOBBER.include 'mysql.gemspec'

def make(target = '')
  pid = system("#{MAKECMD} #{MAKEOPTS} #{target}")
  $?.exitstatus
end

file 'Makefile' => 'extconf.rb' do
  ruby "extconf.rb #{ENV['EXTCONF_OPTS']}"
end

# Let make handle dependencies between c/o/so - we'll just run it. 
file MYSQL_SO => (['Makefile'] + Dir['*.c'] + Dir['*.h']) do
  m = make
  fail "Make failed (status #{m})" unless m == 0
end

task :default => [:compile,:test]

desc "Compile the shared object"
task :compile => [MYSQL_SO]

desc "Run tests"
task :test do
  ruby "test.rb"
end

desc 'Generate gem specification'
task :gemspec do
  require 'erb'
  tspec = ERB.new(File.read(File.join(File.dirname(__FILE__),'mysql.gemspec.erb')))
  specfile = File.join(File.dirname(__FILE__),'mysql.gemspec')
  File.open(specfile,'wb') {|f| f << tspec.result }
  puts "output: #{specfile}"
end

if ! defined?(Gem)
  warn "Package Target requires RubyGEMs"
else
  desc 'Build gem'
  task :package => :gemspec do
    require 'rubygems/specification'
    spec_source = File.read File.join(File.dirname(__FILE__),'mysql.gemspec')
    spec = nil
    # see: http://gist.github.com/16215
    Thread.new { spec = eval("$SAFE = 3\n#{spec_source}") }.join
    spec.validate
    Gem::Builder.new(spec).build
  end
end
