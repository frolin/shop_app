require 'faker'
require 'factory_girl'

FactoryGirl.define do
  factory :product do |f|
    f.title {Faker::Lorem.words(4)}
    f.description {Faker::Lorem.sentence(3, true)}
    f.price {Faker::Commerce.price}
    f.image_file_name {File.open(Dir['app/assets/images/*.jpeg'].sample)}
  end
end