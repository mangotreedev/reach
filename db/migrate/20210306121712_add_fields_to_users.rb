class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :agree_terms, :boolean
    add_column :users, :username, :string
  end
end
