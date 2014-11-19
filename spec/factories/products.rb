require 'faker'
require 'factory_girl'

FactoryGirl.define do

  factory :product do |f|
    f.title {Faker::Lorem.words(4).join(" ")}
    f.description {Faker::Lorem.sentence(3, true)}
    f.price {Faker::Commerce.price}
    f.image {File.open(Dir.glob(File.join(Rails.root, 'db', 'seeds', 'images', '*')).sample) }
  end

end
