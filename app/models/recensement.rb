class Recensement < ApplicationRecord
  belongs_to :fokontany, optional: true

  validates :full_name,
  presence: true

  validates :cin,
  presence: true,
  length: {minimum: 12},
  uniqueness: true

  validates :contact,
  presence: true,
  length: {minimum: 10},
  uniqueness: true
end
