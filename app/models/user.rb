class User < ApplicationRecord
  has_many :investments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :name, uniqueness: true
end
