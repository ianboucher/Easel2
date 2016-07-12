User.destroy_all

# Create users
usernames = ["Bert", "Ernie", "Calvin", "Hobbes"]
emails = ["bert@example.com", "ernie@example.com", "calvin@user.com", "hobbes@tiger.com"]

4.times do |i|
  User.create!(
  username: usernames[i],
  email:    emails[i],
  password: "password",
  confirmed_at: Time.now.utc
  )
end

User.create!(
username: "admin",
email:    "admin@example.com",
password: "password",
role:     2,
confirmed_at: Time.now.utc
)

users = User.all

#Create artist profiles

users.each do |user|
  Profile.create!(
  user_id: user.id,
  name: user.username,
  tagline: Faker::Lorem.sentence(10),
  statement: Faker::Lorem.sentence(100),
  info: Faker::Lorem.sentence(50),
  )
end

profiles = Profile.all

profiles.each do |profile|
  profile.images.create!(file: File.open(File.join(Rails.root, "test#{rand(1..10)}.jpg"), "rb"))
end

100.times do
  Artwork.create!(
  user: users.sample,
  title: Faker::Book.title,
  category: Faker::Book.genre,
  description: Faker::Lorem.sentence(10),
  price: Faker::Number.number(3),
  discount: nil
  )
end

artworks = Artwork.all

artworks.each do |artwork|
  artwork.images.create!(file: File.open(File.join(Rails.root, "test#{rand(1..10)}.jpg"), "rb"))
end

p "#{users.count} users created"
p "#{artworks.count} artworks created"
