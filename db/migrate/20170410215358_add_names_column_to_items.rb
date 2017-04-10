class AddNamesColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, index: true
  end
end
