class Target < ApplicationRecord

  belongs_to :user, optional: true

  validates :user, presence: true

  validates :title, presence: true, length: {maximum: 255}
  #validates :date, presence: true
end
