class Comment < ApplicationRecord
  belongs_to :user, optional: true

  belongs_to :commentable, polymorphic: true

  has_many :answers, dependent: :destroy

  # body поле должно быть
  validates :user, presence: true
  validates :body, presence: true
end
