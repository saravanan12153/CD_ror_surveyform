class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :location
      t.string :language
      t.text :comment

      t.timestamps
    end
  end
end
