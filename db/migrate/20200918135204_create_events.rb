class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :max_amount
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
