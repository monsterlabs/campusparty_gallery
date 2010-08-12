# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.email    'user@test.com'
  f.password '123456'
  f.password_confirmation '123456'
  f.created_at { Time.now.utc }
end
