class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :targets, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  validates :name, uniqueness: true

  #validates :email, presence: true, length: {maximum: 255}
  #validates :email, uniqueness: true
  #validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  #validates :birthday, presence: true

  # при создании нового юзера (create), перед валидацией объекта выполнить метод set_name
  #before_validation :set_name, on: :create

  private

  # задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "Чел №#{rand(777)}" if self.name.blank?
  end
end