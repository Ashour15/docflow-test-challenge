class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.text :body
      t.json :options
      t.references :template_section, null: false, foreign_key: true
      t.timestamps
    end
  end
end
