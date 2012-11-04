class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.timestamp :created
      t.string :environment
      t.string :task
      t.string :branch
      t.string :extra_params
      t.string :output
      t.integer :status

      t.timestamps
    end
  end
end
