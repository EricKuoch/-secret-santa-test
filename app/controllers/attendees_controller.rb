class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
  end

  def create
    @event = Event.find(params[:event_id]) #---> recup l'event id
    @attendee = Attendee.new(event_id: params[:event_id]) # ---> donne event_id a la nouvelle instance d'attendee
    @attendee.user = current_user #----> donne user_id a l'instance @attendee
    @attendee.update(attendee_params) # ---> me permets de recuperer l'email
    @attendee.save
    redirect_to event_path(Event.find(params[:event_id]), notice: 'Event was successfully created.')
  end

  private

  def attendee_params
    params.require(:attendee).permit(:email)
  end

end
