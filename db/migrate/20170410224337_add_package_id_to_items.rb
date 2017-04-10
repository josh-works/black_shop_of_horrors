class AddPackageIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :package, foreign_key: true
  end
end
