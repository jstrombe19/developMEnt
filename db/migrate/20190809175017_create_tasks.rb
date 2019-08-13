class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_date
      t.boolean :complete
      t.belongs_to :goal

      t.timestamps
    end
  end
end
