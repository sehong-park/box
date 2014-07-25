namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Sehong Park",
                 email: "sehong@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    # 50 orders..
    users = User.all(limit: 6)
    50.times do
      users.each { |user| user.microposts.create!(
                                              num_boxes: Random.rand(7),
                                              weeks_storage: Random.rand(10),
                                              charge: num_boxes * weeks_storage,
                                              location_pickup: Faker::Lorem.sentence(2),
                                              description: Faker::Lorem.sentence(1)) }
    end
  end
end