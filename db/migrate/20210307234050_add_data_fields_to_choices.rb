class AddDataFieldsToChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :choices, :x, :integer
    add_column :choices, :y, :integer
    add_column :choices, :width, :integer
    add_column :choices, :height, :integer
  end
end
