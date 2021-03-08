class AddPublishedToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :published, :boolean, default: false
  end
end
