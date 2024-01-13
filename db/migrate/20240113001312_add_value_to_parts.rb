class AddValueToParts < ActiveRecord::Migration[7.1]
  def change
    add_column :parts, :value, :decimal
  end
end
