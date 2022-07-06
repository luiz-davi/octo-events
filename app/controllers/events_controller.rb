class EventsController < ApplicationController
  def index
    render json: events
  end

  private

    def number
      params.permit(:number)
    end

    def events
      ::Event.where(number: number)
             .select("events.action, events.created_at")
    end
end