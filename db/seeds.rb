# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recensement.destroy_all
Fokontany.destroy_all
Commune.destroy_all
Region.destroy_all

reg = ["Analamanga", "Diana", "Sava"]
com = ["Antananarivo", "Talatamaty", "Ivato"]
fkt = ["Ivandry", "Androdra", "Ambomanarina"]

reg.length.times do |i|
    Region.create(name: reg[i])
end

com.length.times do |i|
    Commune.create(name: com[i],
                region_id: rand(Region.first.id .. Region.last.id)
            )
end

fkt.length.times do |i|
    Fokontany.create(name: fkt[i],
                    commune_id: rand(Commune.first.id .. Commune.last.id))
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
<<<<<<< HEAD
=======

User.create(email: "user@user.user", password: "useruser")
Admin.create(email: "admin@admin.com", encrypted_password: "adminadmin")

5.times do |i|
    Candidat.create(description: Faker::Quote.matz,
                full_name: Faker::Games::Zelda.character,
            parti: Faker::Games::Zelda.item
        )
    end
>>>>>>> 24b1c3edeeeba5889fae644c030357e27cf55c4a
puts 'vita'