class Vote < ApplicationRecord
  belongs_to :recensement
  belongs_to :candidat
end
