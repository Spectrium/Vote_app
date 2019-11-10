class Candidat < ApplicationRecord

	has_one_attached :profil
 	has_many :votes 

end
