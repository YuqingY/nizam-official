class Customer < ApplicationRecord
  validates :cnic, uniqueness: true
  validates :cnic, presence: true
end
