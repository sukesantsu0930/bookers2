class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
