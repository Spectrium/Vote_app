class AddHasVotingToRecensements < ActiveRecord::Migration[5.2]
  def change
    add_column :recensements, :has_voting, :boolean
  end
end
