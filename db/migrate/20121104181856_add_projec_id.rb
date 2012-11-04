class AddProjecId < ActiveRecord::Migration
  def up
    change_table :deployments do |t|
      t.integer :project_id
    end
  end
end
