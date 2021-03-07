class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :approved, default: true
      t.integer :style

      t.timestamps
    end
  end
end
