class AddStatusToBooks < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :available, :boolean
  end
end
