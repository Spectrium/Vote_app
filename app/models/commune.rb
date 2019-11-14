class Commune < ApplicationRecord
  belongs_to :region
  has_many :fokontanies
  has_many :admins
  has_many :users

end
