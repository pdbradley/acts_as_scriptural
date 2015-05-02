require 'bundler/gem_tasks'

Dir.glob('tasks/**/*.rake').each(&method(:import))

task :console do
    exec "irb -r acts_as_scriptural -I ./lib"
end

