class Payment < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: true
end
