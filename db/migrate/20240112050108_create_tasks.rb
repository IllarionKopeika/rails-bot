class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :description
      t.string :manager
      t.string :employee
      t.string :email
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
