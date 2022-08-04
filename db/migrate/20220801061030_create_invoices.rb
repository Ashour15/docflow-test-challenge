class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :account_subscription, null: false, foreign_key: true
      t.integer :type, null: false
      t.integer :status, null: false
      t.date :due_date, null: false
      t.decimal :total_amount, null: false, precision: 10, scale: 2
      
      t.timestamps
    end
  end
end
