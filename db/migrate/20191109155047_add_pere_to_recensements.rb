class AddPereToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :pere, :string
  end
end
