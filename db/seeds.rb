require 'faker'

User.create do |user|
    user.email = Faker:: Internet.email 
end 

Wiki.create do |wiki|
    wiki.title = Faker::Lorem.sentence
    wiki.body = Faker::Lorem.paragraph
end