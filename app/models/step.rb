class Step < ApplicationRecord
  belongs_to :target, optional: true

  validates :name, presence: true, length: {maximum: 50}
  validates :status, presence: true
end
