class EventsController < AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  #autocomplete :holder, :first_name, :extra_data => [positions.last.id]

  def new
    @event = Event.new
  end

  def index
    @events = current_user.admin? ? Event.all : user.events
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.event!
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path, :notice => "Event updated."
    else
      redirect_to events_path, :alert => "Unable to update event."
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path, :notice => "Event deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :scheduled)
  end

end