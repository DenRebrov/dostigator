class Target < ApplicationRecord

  belongs_to :user, optional: true

  validates :user, presence: true

  validates :title, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :date, presence: true

  enum status: {
      want_to_read: 0,
      currently_read: 1,
      read: 2,
  }
end
