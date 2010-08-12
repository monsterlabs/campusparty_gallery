require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
['Graduation party', 'Mexico travel Jan 2010', 'Sam Party', 'Halloween', 'Reyes Magos', 'Birthday', 'Mexican Holidays'].each do |name|
  Gallery.create(:name => name, :description => Faker::Lorem.paragraphs)
end

User.create(:email => 'user@test.com', :password => '123456', :password_confirmation => '123456')