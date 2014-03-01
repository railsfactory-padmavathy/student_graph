class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :classroom_id
      t.integer :section_id
      t.timestamps
    end
  end
end
