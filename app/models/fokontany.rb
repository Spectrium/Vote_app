class Fokontany < ApplicationRecord
  belongs_to :commune, optional: true
  has_many :recensements
  has_many :admins
  has_many :users
end
