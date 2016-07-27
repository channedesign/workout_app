class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :duration
      t.text :workout_details
      t.date :activity_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
