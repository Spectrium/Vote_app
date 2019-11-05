class CreateCandidats < ActiveRecord::Migration[5.2]
  def change
    create_table :candidats do |t|
      t.text :description

      t.timestamps
    end
  end
end
