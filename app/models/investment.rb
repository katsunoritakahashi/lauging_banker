class Investment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :stock, presence: true
  validates :bonds, presence: true
  validates :pachinko, presence: true
end
