class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy, foreign_key: :user_id
  has_many :payments, dependent: :destroy, foreign_key: :user_id

  validates :name, presence: true
  validates :email, presence: true
end
