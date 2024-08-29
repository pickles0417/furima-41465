class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birthday, presence: true
end
