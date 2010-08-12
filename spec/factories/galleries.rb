# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.define :gallery do |g|
    g.name { Faker::Lorem.words }
end
