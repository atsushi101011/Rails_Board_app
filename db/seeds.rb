6.times do |n|
  last_name = Faker::Name.name
  first_name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(last_name: last_name,
               first_name: first_name,
               email: email,
               password: password,
               password_confirmation: password)
end

20.times do |n|
title = Faker::Dessert.variety
body = Faker::Dessert.variety
user = User.find(rand(1..6))
Board.create!(title: title,
              body: body,
              user: user)
end