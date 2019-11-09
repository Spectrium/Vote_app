class AddMereToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :mere, :string
  end
end
