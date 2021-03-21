class AddCookieToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :cookie, :string
  end
end
