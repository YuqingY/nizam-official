class Customer < ApplicationRecord
  validates :cnic, uniqueness: true
  validates :cnic, presence: true
  has_many :tickets
end
