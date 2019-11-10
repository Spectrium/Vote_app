class AddLogementToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :logement, :string
  end
end
