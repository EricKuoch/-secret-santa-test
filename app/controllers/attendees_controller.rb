class AttendeesController < ApplicationController
  def new
    @attendee = Attendee.new
  end

  def create
    @attendee_list = []
    @event = Event.find(params[:event_id]) #---> recup l'event id
    @attendee = Attendee.new(event_id: params[:event_id]) # ---> donne event_id a attendee
    @attendee.update(attendee_params) # ---> recup email
    @attendee.user = current_user #----> donne user_id a attendee
    @attendee.save
    redirect_to event_path(Event.find(params[:event_id]), notice: 'Event was successfully created.')
    @attendee_list << @attendee.email
  end

  private

  def attendee_params
    params.require(:attendee).permit(:email)
  end
end
