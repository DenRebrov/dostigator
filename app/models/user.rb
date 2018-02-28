class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # юзер может создавать много целей, комментов
  has_many :messages, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20}
  validates :name, uniqueness: true

  # Добавляем аплоадер аватарок, чтобы заработал carrierwave
  mount_uploader :ava, AvaUploader
end