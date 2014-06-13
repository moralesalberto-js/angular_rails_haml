Fabricator(:user) do
  email { Faker::Internet.email }
  password "password"
  password_confirmation "password"
end

Fabricator(:event) do
  user
  title { Faker::Lorem.words(3).join(' ') }
  description { Faker::Lorem.words(10).join(' ') }
  start_time { Time.zone.now }
  end_time { Time.zone.now + 1.hour }
end
