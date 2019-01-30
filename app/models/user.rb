class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,  :validatable,
         :confirmable, :lockable, :timeoutable
  has_many :information, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end
