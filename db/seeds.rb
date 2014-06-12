# create a few projects

User.delete_all
Event.delete_all

10.times.each_with_index do |i|
  user = User.create!(email: "user#{i}@test.com" , password: "111", password_confirmation: "111")

  start_time = Time.zone.now
  20.times.each_with_index do |i|
    start_time = start_time + 5.hours
    end_time = start_time + 30.minutes
    user.events.create!(:title => Faker::Lorem.words(3).join(" "), start_time: start_time, end_time: end_time)
  end
end
