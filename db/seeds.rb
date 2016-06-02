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

p "#{users.count} users created"
