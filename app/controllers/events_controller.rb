class EventsController < ApplicationController
  layout 'events_angular'

  def index
    @events = current_user.events
  end

  def show

  end

  # POST /ducks.json
  def create
    @event = current_user.events.create(event_params)
    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end
end
