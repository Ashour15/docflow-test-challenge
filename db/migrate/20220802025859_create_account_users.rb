class CreateAccountUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :account_users do |t|
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.index [:account_id, :user_id], unique: true
      t.timestamps
    end
  end
end
