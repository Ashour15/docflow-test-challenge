class CreateTemplateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :template_sections do |t|
      t.references :template, null: false, foreign_key: true
      t.timestamps
    end
  end
end
