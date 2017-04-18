class RemoveCategoriesFromTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :organs
  end
end
