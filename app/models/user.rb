class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :saving, presence: true, length: { maximum: 10 }
  validates :income, presence: true, length: { maximum: 10 }
end
