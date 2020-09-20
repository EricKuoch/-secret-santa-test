class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendee = Attendee.new
  end

  def group

    #Creer le group de participants avec tous les mails (attendee_list)
    @attendee_list = []
    @event = Event.find(params[:id])
    @event.attendees.each do |attendee|
      @attendee_list << attendee.email
    end
    @event.save

    # associer de manière aléatoire un utilisateur à un autre
    @pairs_shuffled = @attendee_list.shuffle
    @pairs_shuffled << @pairs_shuffled.first # repeat the first player
    @assignments = @pairs_shuffled.each_cons(2).to_a
  end


  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :max_amount, :group)
  end
end
