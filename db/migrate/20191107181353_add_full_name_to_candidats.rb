class AddFullNameToCandidats < ActiveRecord::Migration[5.2]
  def change
    add_column :candidats, :full_name, :string
  end
end
