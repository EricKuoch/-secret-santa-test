class AddGroupToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :group, :string
  end
end
