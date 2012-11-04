class Deployment < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :branch, :environment, :extra_params, :output, :status, :task, :project_id
end
