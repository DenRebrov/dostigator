class Target < ApplicationRecord

  belongs_to :user, optional: true

  has_many :comments, dependent: :destroy

  validates :user, presence: true

  validates :title, presence: true, length: {maximum: 60}

  validates :status, presence: true

  #validates :date, presence: true
end
