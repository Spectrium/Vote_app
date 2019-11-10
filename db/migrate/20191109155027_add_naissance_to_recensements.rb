class AddNaissanceToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :naissance, :string
  end
end
