# Creating users
User.create!(name: 'Happy User', email: 'happy@email.com', password: 'blabla', password_confirmation: 'blabla')

99.times do |n|
  name = Faker::Name.name
  email = 'happy-#{n+1}@email.com'
  password = 'password'
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

# Creating tweets
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(content: content) }
end
