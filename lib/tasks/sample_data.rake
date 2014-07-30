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
    user = User.first
    10.times do
      
      unit_count = Random.rand(7)
      store_weeks = Random.rand(10)
      pickup_address = Faker::Lorem.sentence(2)
      why_ordering = Faker::Lorem.sentence(1)
      
      user.orders.create!(
          unit_count: unit_count,
          store_weeks: store_weeks,
          charge: unit_count * store_weeks,
          pickup_address: pickup_address,
          why_ordering: why_ordering )
    end
  end
end