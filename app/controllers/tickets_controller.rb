class TicketsController < ApplicationController
  autocomplete :ticket, :customer_cnic, full: true
  skip_after_action :verify_authorized, only: :autocomplete_ticket_customer_cnic

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  autocomplete :customer_cnic, full: true

  def index
    current_user.current_state = 'idle'
    @check_index = true
    if user_signed_in?
     @tickets = policy_scope(Ticket)
   else
    redirect_to new_user_session_path
  end
end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    current_user.current_state = "ticket #{@ticket.id}"
  end

  # GET /tickets/new
  def new
    @no_log_out = true
    @call = Call.find(params[:call_id])
    @ticket = Ticket.new
    @ticket.author = current_user
    @ticket.status = 'new'
    @call.ticket = @ticket
    authorize @ticket
    @function = "new"
  end

  # GET /tickets/1/edit
  def edit
    @no_log_out = true
    current_user.current_state = "ticket #{@ticket.id}"
  end

  # POST /tickets
  # POST /tickets.json
  def create
    call_id = ticket_params.delete(:call_id)
    @call=Call.find(call_id)
    session[:call_end_time] = Time.now
    @call.update end_time: Time.now
    duration = (session[:call_end_time].to_time - session[:call_start_time].to_time)
    pretty_time = Time.at(duration).utc.strftime("%H:%M:%S")
    @call.update duration: duration
    cleaned_params = ticket_params.reject {|k,v| k == 'call_id'}

    @ticket = Ticket.new(cleaned_params)
    @ticket.calls << @call
    @ticket.author = current_user
    @ticket.status = 'new'
    authorize @ticket

    if @ticket.save
      respond_to do |format|
        redirect_to @ticket, notice: "Ticket was successfully created in: #{pretty_time} "
      end
    else
      render :new
    end

  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    if @ticket.update(ticket_params)
        #find the call
        @call=Call.find(session[:current_call_id])
        # set call end time to now
        session[:call_end_time] = Time.now
        @call.update end_time: Time.now

        duration = session[:call_end_time] - session[:call_start_time].to_time
        pretty_time = Time.at(duration).utc.strftime("%H:%M:%S")
        @call.update duration: duration
        #associate call to ticket
        @call.ticket = @ticket
        authorize @ticket

         # if @ticket
         #   if @ticket
         #     # @ticket.calls.last.end_time = Time.now
         #     @end_time = Time.now
         #     session[:call_end_time] = Time.now
         #    @ticket.call.end_time = @end_time
         #    @session_end_time = @session[:call_end_time]
         #    end
         # end
         redirect_to @ticket, notice: "Ticket was successfully updated in: #{pretty_time}"
       else
        render :edit
      end
    end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  def new_ticket
    Ticket.new_ticket
  end

  def active_ticket
    Ticket.active_ticket
  end

  def pending_ticket
    Ticket.pending_ticket
  end

  def ready_ticket
    Ticket.ready_ticket
  end

  def closed_ticket
    Ticket.closed_ticket
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
      authorize @ticket
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:category, :department, :next_step, :description, :status, :author, :customer_cnic, :assignee_id, :assigner_id, :call_id)
  end
end
