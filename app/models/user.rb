class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collectives
  has_many :subscriptions
  has_many :memberships

  validates :name, presence: true

  before_validation { self.name = email.gsub(/@.*/, '') if name.nil? }
end
