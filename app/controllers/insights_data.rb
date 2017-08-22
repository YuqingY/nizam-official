def average_call_duration
  sum = 0
  calls = Call.all.select {|c| c.duration}
  calls.each do |call|
    sum += call.duration
  end
  average = sum / (calls.count)
end

def average_response_time
  sum = 0
  tickets = Ticket.all.select {|t| t.response_time}
  tickets.each do |ticket|
    sum += ticket.response_time
  end
  average = sum / (tickets.count)
end

def average_resolve_time
  sum = 0
  tickets = Ticket.all.select {|t| t.resolve_time}
  tickets.each do |ticket|
    sum += ticket.resolve_time
  end
  average = sum / (tickets.count)
end

def average_waiting_time
  sum = 0
  tickets = Ticket.all.select {|t| t.status == 'new'}
  tickets.each do |ticket|
    sum += Time.now - ticket.created_at
  end
  average = sum / (tickets.count)
end

def average_processing_time
  sum = 0
  tickets = Ticket.all.select {|t| t.status != 'closed'}
  tickets.each do |ticket|
    sum += Time.now - ticket.created_at
  end
  average = sum / (tickets.count)
end

def total_call_today
  Call.all.select{|c| c.created_at.today? }.count
end

def user_total_call_today(user)
  Call.all.select{ |c| c.created_at.today? && c.user == user}.count
end

def total_call_week
  Call.all.select{|c| c.created_at.between?(Time.zone.now.ago(1.week), Time.zone.now) }.count
end

def user_total_call_week(user)
  Call.all.select{ |c| c.created_at.between?(Time.zone.now.ago(1.week), Time.zone.now) && c.user == user}.count
end

def total_call_month
  Call.all.select{|c| c.created_at.between?(Time.zone.now.ago(1.month), Time.zone.now) }.count
end

def user_total_call_month(user)
  Call.all.select{ |c| c.created_at.between?(Time.zone.now.ago(1.month), Time.zone.now) && c.user == user}.count
end

def outbond_inbond
  outbond_inbond = {}
  outbond_inbond[:inbond] Call.all.select{ |c| c.inbond }
  outbond_inbond[:outbond] Call.all.select{ |c| c.inbond == false }
end








