class CreateDaties < ActiveRecord::Migration[5.2]
  def change
    create_table :daties do |t|
      t.datetime :debut_propagande
      t.datetime :fin_propagande
      t.datetime :debut_vote
      t.datetime :fin_vote

      t.timestamps
    end
  end
end
