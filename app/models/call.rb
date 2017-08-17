class Call < ApplicationRecord
  belongs_to :ticket
  has_one :user, through: :ticket, source: :author
end
