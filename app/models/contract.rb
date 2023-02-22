class Contract < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_Key: 'author_id'
  has_and_belongs_to_many :groups, foreign_key: 'contract_id'

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :groups, presence: true
end
