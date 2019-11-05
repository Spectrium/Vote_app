class User < ApplicationRecord
  belongs_to :region
  belongs_to :commune
  belongs_to :fokontany
end
