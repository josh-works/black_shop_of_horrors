class AddQuantityToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :quantity, :integer
  end
end
