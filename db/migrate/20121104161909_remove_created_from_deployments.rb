class RemoveCreatedFromDeployments < ActiveRecord::Migration
  def up
    remove_column :deployments, :created
  end
end
