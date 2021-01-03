# == Schema Information
#
# Table name: articles
#
# @!attribute id
#   @return []
# @!attribute body
#   @return [String]
# @!attribute title
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
