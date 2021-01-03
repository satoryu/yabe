# == Schema Information
#
# Table name: comments
#
# @!attribute id
#   @return []
# @!attribute body
#   @return [String]
# @!attribute visible
#   @return [Boolean]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute article_id
#   @return [Integer]
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#

class Comment < ApplicationRecord
  belongs_to :article
end
