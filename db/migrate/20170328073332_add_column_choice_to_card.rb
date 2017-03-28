class AddColumnChoiceToCard < ActiveRecord::Migration[5.0]
  def change

      remove_column :cards, :budget
      remove_column :cards, :employers
      remove_column :cards, :population

      add_column :cards, :budget_oui, :integer
      add_column :cards, :employers_oui, :integer
      add_column :cards, :population_oui, :integer
      add_column :cards, :budget_non, :integer
      add_column :cards, :employers_non, :integer
      add_column :cards, :population_non, :integer


  end
end
