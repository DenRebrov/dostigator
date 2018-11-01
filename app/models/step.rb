class Step < ApplicationRecord
  belongs_to :target, optional: true

  validates :name, presence: true, length: {maximum: 70}
  validates :status, presence: true
end
