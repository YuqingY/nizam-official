class Ticket < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :assignee, class_name: User, required: false
  belongs_to :assigner, class_name: User, required: false
  belongs_to :customer
  validates :status, presence: true

  scope :active_ticket, -> (){ where(status: "active") }
  scope :new_ticket, -> (){ where(status: "new") }
  scope :pending_ticket, -> (){ where(status: "pending") }
  scope :ready_ticket, -> (){ where(status: "ready") }
  scope :closed_ticket, -> (){ where(status: "closed") }

  # def self.active
  #   Ticket.all.select { |x| x.status == "active"}
  # end
end
