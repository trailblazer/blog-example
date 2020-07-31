class AddModeratorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moderator, :boolean, default: false, nil: false
  end
end
