class Ticket < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :assignee, class_name: User, required: false
  belongs_to :assigner, class_name: User, required: false
  # def self.active
  #   .select
  # end
end
