class CreateCards < ActiveRecord::Migration[5.0]


  def change
    create_table :cards do |t|
      t.string :title
      t.text :desc
      t.integer :budget
      t.integer :employers
      t.integer :population
      
      t.timestamps
    end
  end
end
