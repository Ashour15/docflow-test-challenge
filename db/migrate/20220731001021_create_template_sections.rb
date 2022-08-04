class CreateTemplateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :template_sections do |t|
      t.references :template, null: false, foreign_key: true
      t.string :content_type
      t.integer :content_id
      t.timestamps
    end
  end
end
