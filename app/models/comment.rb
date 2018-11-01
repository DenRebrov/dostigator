class Comment < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: 'created_at DESC'

  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true

  # body, user поле должно быть
  validates :user, presence: true
  validates :body, presence: true
end
