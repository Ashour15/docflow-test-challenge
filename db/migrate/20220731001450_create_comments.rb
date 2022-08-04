class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body, null: false
      t.integer :parent_id, null: true
      t.references :commentable, null: true, polymorphic: true

      t.timestamps
    end
  end
end
