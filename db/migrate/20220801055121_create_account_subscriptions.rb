class CreateAccountSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :account_subscriptions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :subscription_plan, null: false, foreign_key: true
      t.references :invoice, null: true, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :status, null: false
      t.integer :billing_period, null: false
      t.timestamps
    end
  end
end
