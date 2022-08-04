class CreateSubscriptionPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_plans do |t|
      t.string :name, null: false
      t.integer :max_users, null: false
      t.integer :max_templates, null: false
      t.decimal :price_per_month, null: false, precision: 10, scale: 2
      t.decimal :price_per_year, null: false, precision: 10, scale: 2
      t.decimal :price_per_user_month, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
