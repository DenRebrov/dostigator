class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # юзер может создавать много целей, комментов
  has_many :targets, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  validates :name, uniqueness: true

  validates :birthday, presence: true
end