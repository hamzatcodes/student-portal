class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.date :age
      t.string :matric_no
      t.string :phone
      t.integer :department_id
      t.string :password_digest
      t.timestamps
    end
  end
end
