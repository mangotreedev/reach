class AddDataFieldsToChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :choices, :left, :float
    add_column :choices, :top, :float
    add_column :choices, :width, :float
    add_column :choices, :height, :float
  end
end
