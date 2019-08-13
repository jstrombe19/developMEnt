class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :perfect_days
      t.integer :best_streak
      t.integer :current_streak

      t.timestamps
    end
  end
end
