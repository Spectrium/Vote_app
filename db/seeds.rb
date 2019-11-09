# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recensement.destroy_all

5.times do |i|
    Recensement.create(full_name: Faker::Name.name,
                        cin: Faker::Number.number(digits: 12),
                        contact: Faker::Number.number(digits: 10)
                    )
end 

puts 'vita'