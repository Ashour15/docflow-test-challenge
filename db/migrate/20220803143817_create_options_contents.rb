class CreateOptionsContents < ActiveRecord::Migration[6.1]
  def change
    create_table :options_contents do |t|
      t.json :options, null: false
      t.timestamps
    end
  end
end
