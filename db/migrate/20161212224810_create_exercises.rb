class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :duration
      t.string :details
      t.date :workout_date

      t.timestamps null: false
    end
  end
end
