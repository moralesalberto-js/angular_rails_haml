class EventsController < ApplicationController
  layout 'events_angular'

  def index
    @events = current_user.events
  end
end
