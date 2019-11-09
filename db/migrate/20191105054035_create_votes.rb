class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :recensement, foreign_key: true
      t.references :candidat, foreign_key: true

      t.timestamps
    end
  end
end
