class CreateOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :organs do |t|
      t.string :name
      t.integer :price
    end
  end
end
