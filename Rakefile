require 'rake'
require 'redis'
require 'mongoid'
require 'mongoid-locker'
require 'telegram/bot'
require 'sucker_punch'
require 'active_support/all'
require 'cachy'

def reload!
  Dir[File.dirname(__FILE__) + '/config/inits/*.rb'].each{ |file| load file }
  Dir[File.dirname(__FILE__) + "/lib/#{$namespace}.rb"].each{ |file| load file }
  Dir[File.dirname(__FILE__) + "/lib/#{$namespace}/**/*.rb"].each{ |file| load file }
end

load 'config/inits/init.rb'
Mongoid.load!(File.dirname(__FILE__) + '/config/mongoid.yml', :production)

namespace $namespace.to_sym do
  task :reload do
    reload!
  end

  task start: :reload do
    $namespace_class.constantize.start
  end

  task :init do
    load 'lib/project_init.rb'
    ProjectInit.start
  end
end

task default: "#{$namespace}:start"
