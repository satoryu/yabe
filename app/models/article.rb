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

class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end
