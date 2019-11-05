class Fokontany < ApplicationRecord
  belongs_to :commune
  has_many :recensements
end
