# Creating users
User.create!(name: 'Happy User', email: 'happy@email.com', password: 'blabla', password_confirmation: 'blabla')

99.times do |n|
  name = Faker::Name.name
  email = 'happy-#{n+1}@email.com'
  password = 'password'
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end
