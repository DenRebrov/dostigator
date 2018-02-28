class Target < ApplicationRecord
  belongs_to :user, optional: true

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :steps, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 70}
  validates :status, presence: true
  validates :date, presence: true

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
end
