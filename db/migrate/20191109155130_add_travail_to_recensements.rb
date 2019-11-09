class AddTravailToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :travail, :string
  end
end
