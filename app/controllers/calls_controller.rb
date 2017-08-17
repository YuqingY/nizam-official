class CallsController < ApplicationController
  def new
   @call = Call.new
   authorize @call
   @start_time = Time.now
  end

  redirect_to
end
