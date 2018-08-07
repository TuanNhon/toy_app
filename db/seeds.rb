User.create! name:  "Example User", email: "example@railstutorial.org",
  password: "111111", password_confirmation: "111111", admin: true,
  activated: true, activated_at: Time.zone.now

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "111111"
  User.create! name:  name, email: email, password: password, activated: true,
    password_confirmation: password, activated_at: Time.zone.now
end

users = User.order(:created_at).take(6)
20.times do
  content = Faker::Lorem.sentence(5)
  users.each {|user| user.microposts.create!(content: content)}
end
