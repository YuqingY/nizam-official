class Call < ApplicationRecord
  belongs_to :ticket
  has_one :user, through: :ticket, source: :author
  before_save :calculate_duration
  def calculate_duration
    if end_time
     duration = end_time - start_time
    end
  end

  def self.user_call_duration(user)
    sum = 0
    calls = Call.all.select {|c| c.duration && c.user == user}
    calls.each do |call|
      sum += call.duration
    end
    average = sum / (calls.count) / 60
  end

  def self.user_duration_hash(user)
    calls = Call.all.select {|c| c.user == user}
    {"< 5 mins": calls.select{|c| c.duration < 300 }.count,
     '5 - 10 mins': calls.select{|c| c.duration >= 300 && c.duration < 600 }.count,
     '10 - 20 mins': calls.select{|c| c.duration >= 600 && c.duration < 1200 }.count,
     '20 - 30 mins': calls.select{|c| c.duration >= 1200 && c.duration < 1800 }.count,
     "> 30 mins": calls.select{|c| c.duration >= 1800 }.count }
  end

  def self.average_call_duration
    sum = 0
    calls = Call.all.select {|c| c.duration}
    calls.each do |call|
      sum += call.duration
    end
    average = sum / (calls.count) / 60
  end

  def self.duration_hash
    {"< 5 mins": Call.all.select{|c| c.duration < 300 }.count,
     '5 - 10 mins': Call.all.select{|c| c.duration >= 300 && c.duration < 600 }.count,
     '10 - 20 mins': Call.all.select{|c| c.duration >= 600 && c.duration < 1200 }.count,
     '20 - 30 mins': Call.all.select{|c| c.duration >= 1200 && c.duration < 1800 }.count,
     "> 30 mins": Call.all.select{|c| c.duration >= 1800 }.count }
  end
end
