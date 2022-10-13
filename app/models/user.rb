class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :foods, dependent: :destroy, foreign_key: 'user_id'
  has_many :recipes, dependent: :destroy, foreign_key: 'user_id'

  def admin?
    role
  end

end
