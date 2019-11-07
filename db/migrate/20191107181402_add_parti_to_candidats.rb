class AddPartiToCandidats < ActiveRecord::Migration[5.2]
  def change
    add_column :candidats, :parti, :string
  end
end
