class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
