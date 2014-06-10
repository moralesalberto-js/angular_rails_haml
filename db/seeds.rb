# create a few projects

10.times.each do
  Project.create(name: Faker::Lorem.words(3).join(" "))
end
