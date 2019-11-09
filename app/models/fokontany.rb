class Fokontany < ApplicationRecord
  belongs_to :commune, optional: true
  has_many :recensements
end
