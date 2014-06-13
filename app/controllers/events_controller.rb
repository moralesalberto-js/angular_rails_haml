# This is strictly a json api, all views are json
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]
  def index
    @events = current_user.events
  end

  def show

  end


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

  def destroy
    @event.destroy
    respond_to do |format|
      format.json { head :no_content }
    end 
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
