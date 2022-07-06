class EventsController < ApplicationController
  def index
    render json: events, status: :ok
  end

  def create
    if initialize_event.save
      head :success 
    else
      head :unprocessable_entity
    end
  end

  private

    def number
      params.permit(:number)
    end

    def events
      ::Event.where(number: number)
             .select("events.action, events.created_at")
    end

    def initialize_event
      Event.new(
        action: params[:action],
        number: params[:number]
      )
    end
end