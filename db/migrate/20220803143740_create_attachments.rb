class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :file
      t.string :name
      t.string :type
      t.string :size
      t.string :path
      t.string :url
      t.references :user, null: false, foreign_key: true
      t.integer :attachmentable_id
      t.string :attachmentable_type
      t.timestamps
    end
  end
end
