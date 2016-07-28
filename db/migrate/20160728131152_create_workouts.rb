class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :duration
      t.text :workout_details
      t.string :activity_date
      t.references :user, index: true, foreign_key: true
    end
  end
end
