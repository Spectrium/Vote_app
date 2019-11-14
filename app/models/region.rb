class Region < ApplicationRecord
	has_many :communes
	has_many :admins
	has_many :users
end
