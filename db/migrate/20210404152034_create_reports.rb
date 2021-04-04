class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :reason
      t.references :survey, null: false, foreign_key: true
      t.boolean :resolved, default: false

      t.timestamps
    end
  end
end
