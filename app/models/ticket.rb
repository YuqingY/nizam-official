class Ticket < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :assignee, class_name: User, required: false
  belongs_to :assigner, class_name: User, required: false
  has_many :calls
  has_many :comments, dependent: :destroy

  validates :status, presence: true
  validates :customer_cnic, presence: true

  scope :active_ticket, -> (){ where(status: "active") }
  scope :new_ticket, -> (){ where(status: "new") }
  scope :pending_ticket, -> (){ where(status: "pending") }
  scope :ready_ticket, -> (){ where(status: "ready") }
  scope :closed_ticket, -> (){ where(status: "closed") }

  # def active
  #   Ticket.all.select { |x| x.status == "active"}
  # end
  def self.response_time_hash
    {"< 1 HOURS": Ticket.all.select{|t| t.response_time < 3600 }.count,
     '< 5 HOURS': Ticket.all.select{|t| t.response_time >= 3600 && t.response_time < 18000 }.count,
     '< 1 DAY': Ticket.all.select{|t| t.response_time >= 18000 && t.response_time < 86400  }.count,
     "> 1 DAY": Ticket.all.select{|t| t.response_time >= 86400 }.count }
  end

  def self.waiting_time_hash
    tickets = Ticket.all.select{|t| t.status = 'new'}
    {"< 1 HOURS": tickets.select{|t| (Time.zone.now - t.created_at) < 3600 }.count,
     '< 5 HOURS': tickets.select{|t| (Time.zone.now - t.created_at) >= 3600 && (Time.zone.now - t.created_at) < 18000 }.count,
     '< 1 DAY': tickets.select{|t| (Time.zone.now - t.created_at) >= 18000 && (Time.zone.now - t.created_at) < 86400  }.count,
     "> 1 DAY": tickets.select{|t| (Time.zone.now - t.created_at) >= 86400 }.count }
  end

  def self.resolve_time_hash
    {"< 12 HOURS": Ticket.all.select{|t| t.resolve_time < 43200 }.count,
     '< 24 HOURS': Ticket.all.select{|t| t.resolve_time >= 43200 && t.resolve_time < 86400 }.count,
     '< 72 HOURS': Ticket.all.select{|t| t.resolve_time >= 86400 && t.resolve_time < 259200  }.count,
     "> 72 HOURS": Ticket.all.select{|t| t.resolve_time >= 259200 }.count }
  end

  def self.processing_time_hash
    tickets = Ticket.all.select{|t| t.status != 'closed'}
    {"< 1 HOURS": tickets.select{|t| (Time.zone.now - t.created_at) < 3600 }.count,
     '< 5 HOURS': tickets.select{|t| (Time.zone.now - t.created_at) >= 3600 && (Time.zone.now - t.created_at) < 18000 }.count,
     '< 1 DAY': tickets.select{|t| (Time.zone.now - t.created_at) >= 18000 && (Time.zone.now - t.created_at) < 86400  }.count,
     "> 1 DAY": tickets.select{|t| (Time.zone.now - t.created_at) >= 86400 }.count }
  end

  def self.call_to_ticket_hash
    {
      "1 call": Ticket.all.select{|t| t.calls.count == 1}.count,
      "2 calls": Ticket.all.select{|t| t.calls.count == 2}.count,
      "3 calls": Ticket.all.select{|t| t.calls.count == 3}.count,
      "> 3 callS": Ticket.all.select{|t| t.calls.count > 3}.count
    }
  end

  def self.average_response_time
    sum = 0
    tickets = Ticket.all.select {|t| t.response_time}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += ticket.response_time
      end
      average = sum / (tickets.count) / 3600
    else
      0
    end
  end

  def self.average_resolve_time
    sum = 0
    tickets = Ticket.all.select {|t| t.resolve_time}
    tickets.each do |ticket|
      sum += ticket.resolve_time
    end
    average = sum / (tickets.count) / 3600
  end

  def self.average_waiting_time
    sum = 0
    tickets = Ticket.all.select {|t| t.status == 'new'}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += Time.now - ticket.created_at
      end
      return average = sum / (tickets.count) / 3600
    else
      0
    end
  end

  def self.average_processing_time
    sum = 0
    tickets = Ticket.all.select {|t| t.status != 'closed'}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += Time.now - ticket.created_at
      end
      average = sum / (tickets.count) / 3600
    else
      0
    end

  end
  def self.user_response_time_hash(user)
    tickets =  Ticket.all.select{ |t| t.author_id == user.id}
    {"< 1 HOURS": tickets.select{|t| t.response_time < 3600 }.count,
     '< 5 HOURS': tickets.select{|t| t.response_time >= 3600 && t.response_time < 18000 }.count,
     '< 1 DAY': tickets.select{|t| t.response_time >= 18000 && t.response_time < 86400  }.count,
     "> 1 DAY": tickets.select{|t| t.response_time >= 86400 }.count }
  end

  def self.user_waiting_time_hash(user)
    tickets = Ticket.all.select{|t| t.status = 'new' && t.author_id == user.id}
    {"< 1 HOURS": tickets.select{|t| (Time.zone.now - t.created_at) < 3600 }.count,
     '< 5 HOURS': tickets.select{|t| (Time.zone.now - t.created_at) >= 3600 && (Time.zone.now - t.created_at) < 18000 }.count,
     '< 1 DAY': tickets.select{|t| (Time.zone.now - t.created_at) >= 18000 && (Time.zone.now - t.created_at) < 86400  }.count,
     "> 1 DAY": tickets.select{|t| (Time.zone.now - t.created_at) >= 86400 }.count }
  end

  def self.user_resolve_time_hash(user)
    tickets = Ticket.all.select{ |t| t.author_id == user.id}
    {"< 12 HOURS": tickets.select{|t| t.resolve_time < 43200 }.count,
     '< 24 HOURS': tickets.select{|t| t.resolve_time >= 43200 && t.resolve_time < 86400 }.count,
     '< 72 HOURS': tickets.select{|t| t.resolve_time >= 86400 && t.resolve_time < 259200  }.count,
     "> 72 HOURS": tickets.select{|t| t.resolve_time >= 259200 }.count }
  end

  def self.user_processing_time_hash(user)
    tickets = Ticket.all.select{|t| t.status != 'closed' && t.author_id == user.id}
    {"< 1 HOURS": tickets.select{|t| (Time.zone.now - t.created_at) < 3600 }.count,
     '< 5 HOURS': tickets.select{|t| (Time.zone.now - t.created_at) >= 3600 && (Time.zone.now - t.created_at) < 18000 }.count,
     '< 1 DAY': tickets.select{|t| (Time.zone.now - t.created_at) >= 18000 && (Time.zone.now - t.created_at) < 86400  }.count,
     "> 1 DAY": tickets.select{|t| (Time.zone.now - t.created_at) >= 86400 }.count }
  end

  def self.user_average_response_time(user)
    sum = 0
    tickets = Ticket.all.select {|t| t.response_time && t.author_id == user.id}
    tickets.each do |ticket|
      sum += ticket.response_time
    end
    average = sum / (tickets.count) / 3600
  end

  def self.user_average_resolve_time(user)
    sum = 0
    tickets = Ticket.all.select {|t| t.resolve_time && t.author_id == user.id}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += ticket.resolve_time
      end
      average = sum / (tickets.count) / 3600
    else
      0
    end
  end

  def self.user_average_waiting_time(user)
    sum = 0
    tickets = Ticket.all.select {|t| t.status == 'new' && t.author_id == user.id}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += Time.now - ticket.created_at
      end
      average = sum / (tickets.count) / 3600
    else
      0
    end
  end

  def self.user_average_processing_time(user)
    sum = 0
    tickets = Ticket.all.select {|t| t.status != 'closed' && t.author_id == user.id}
    if tickets.count != 0
      tickets.each do |ticket|
        sum += Time.now - ticket.created_at
      end
      average = sum / (tickets.count) / 3600
    else
      0
    end
  end
end
