class CallsController < ApplicationController
  def new
    @start_time = Time.now

    @call = Call.new
    @ticket = default_ticket
    @call.ticket = @ticket
    @call.start_time = @start_time
    authorize @call
    @call.save

  end

  private

  def default_ticket
      Ticket.find(1)
  end

end
