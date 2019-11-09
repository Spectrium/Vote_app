class AddCodeVoteToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :code_vote, :string
  end
end
