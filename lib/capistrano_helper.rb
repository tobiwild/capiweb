class CapistranoHelper
  def initialize(path)
    @root = path
  end
  
  def executable_tasks
    tasks - stage_tasks
  end
  
  def stage_tasks
    tasks.select do|t|
      t.body.source_location.first.end_with?('multistage.rb') and
      ! t.fully_qualified_name.start_with?('multistage:')
    end
  end
  
  def tasks
    config.task_list(:all)
  end

  private
  
  def config
    @config ||= load_config
  end
  
  def load_config
    cwd = Dir.getwd
    Dir.chdir @root
    
    original_stdout = $stdout
    $stdout = StringIO.new
    result  = Capistrano::CLI.parse(%W(-T)).execute!
    $stdout = original_stdout

    Dir.chdir cwd
    
    result
  end
end

module Capistrano
   class Configuration
     module Namespaces
         private
         
         def all_methods
           []
         end
     end
   end
end