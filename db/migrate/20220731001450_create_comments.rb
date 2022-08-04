class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body, null: false
      t.references :parent, null: true, foreign_key: true
      t.references :commentable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
