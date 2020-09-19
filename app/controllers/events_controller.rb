class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      Attendee.create(user: current_user, event: @event)
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendee = Attendee.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.group = @event.attendees.each do |attendee|
      attendee.email
    end
  end


  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :max_amount, :group)
  end
end
