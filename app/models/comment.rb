class Comment < ApplicationRecord
  belongs_to :target
  belongs_to :user, optional: true

  # target, body поле должно быть
  validates :target, presence: true
  validates :body, presence: true
end
