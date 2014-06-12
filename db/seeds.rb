# create a few projects


10.times.each do
  user = User.create(:email => Faker::Internet.email, :password => "111", :password_confirmation => "111")

  Project.create(user_id: user.id, name: Faker::Lorem.words(3).join(" "))
end
