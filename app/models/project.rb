class Project < ActiveRecord::Base
  has_many :deployments
  
  attr_accessible :path
  
  def executable_tasks
    cap.executable_tasks
  end
  
  def stage_tasks
    cap.stage_tasks
  end
  
  def branches
    result = []
    
    repo.refs.each do |ref|
      if %r{/refs/remotes/origin/(.+)}.match(ref)
        result << $1
      end
    end
    
    result
  end
  
  private
  
  def repo
    @repo ||= Rugged::Repository.new(path)
  end
  
  def cap
    @cap ||= CapistranoHelper.new(path)    
  end
end
