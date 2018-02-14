class Comment < ApplicationRecord
  belongs_to :user, optional: true

  belongs_to :commentable, polymorphic: true

  # body поле должно быть
  validates :user, presence: true
  validates :body, presence: true
end
