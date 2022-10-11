class User < ApplicationRecord
  has_many :foods, dependent: :destroy, foreign_key: 'user_id'
  has_many :recipes, dependent: :destroy, foreign_key: 'user_id'
end
