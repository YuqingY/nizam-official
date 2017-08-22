class Call < ApplicationRecord
  belongs_to :ticket
  has_one :user, through: :ticket, source: :author
  before_save :calculate_duration
  def calculate_duration
    if end_time
     duration = end_time - start_time
    end
  end
end
