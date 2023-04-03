class Payment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_and_belongs_to_many :groups, through: :payments_groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
