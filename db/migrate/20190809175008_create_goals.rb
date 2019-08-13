class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.datetime :deadline
      t.string :icon
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
