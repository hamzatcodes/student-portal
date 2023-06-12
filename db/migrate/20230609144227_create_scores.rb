class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :number
      t.integer :course_id
      t.integer :student_id
      t.timestamps
    end
  end
end
