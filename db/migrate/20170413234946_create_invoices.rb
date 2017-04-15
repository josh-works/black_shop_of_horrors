class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end