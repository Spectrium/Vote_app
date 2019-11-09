# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recensement.destroy_all
Fokontany.destroy_all

fkt = ["ivandry", "Androdra", "Ambomanarina"]

fkt.length.times do |i|
    Fokontany.create(name: fkt[i])
end

5.times do |i|
    Recensement.create(full_name: Faker::Name.name,
                        cin: Faker::Number.number(digits: 12),
                        contact: Faker::Number.number(digits: 10),
                        pere: Faker::JapaneseMedia::DragonBall.character,
                        mere: Faker::JapaneseMedia::OnePiece.character,
                        logement: Faker::Address.street_address,
                        travail: Faker::Job.position,
                        fokontany_id: rand(Fokontany.first.id .. Fokontany.last.id)
                      
                    )
end 

puts 'vita'