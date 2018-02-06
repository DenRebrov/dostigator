class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :targets, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  validates :name, uniqueness: true

  validates :birthday, presence: true
end