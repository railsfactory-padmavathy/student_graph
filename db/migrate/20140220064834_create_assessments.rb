class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :FA1
      t.integer :FA2
      t.integer :SA1
      t.integer:student_id
      t.timestamps
    end
  end
end
