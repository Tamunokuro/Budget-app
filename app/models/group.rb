class Group < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_and_belongs_to_many :payments, through: :payments_groups

  validates :name, presence: true
  validates :icon, presence: true
end
