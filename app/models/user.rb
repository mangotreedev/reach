class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :agree_terms, presence: true
  validates :username, uniqueness: {
    message: "%{value} is already taken!"
  }

  has_many :surveys
end
