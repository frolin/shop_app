# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
require 'faker'
require 'factory_girl'


Product.destroy_all

20.times do |t|
Product.create!(
    title: Faker::Lorem::words(4).join(" ") ,
    description: Faker::Lorem::sentences(1).join(" ") ,
    price: Faker::Commerce.price,
    # image: File.open(Dir['app/assets/images/*.jpeg'].sample).join(" ")
    image: File.open(Dir.glob(File.join(Rails.root, 'vendor/assets/fake_images', '*')).sample)
)
end