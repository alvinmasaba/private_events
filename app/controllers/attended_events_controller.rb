class AttendedEventsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @attended_event = AttendedEvent.new
  end

  def create
    @attended_event = AttendedEvent.new(attended_event_params)

    if @attended_event.save!
      redirect_to event_path(params[:attended_event_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attended_event_params
    params.permit(:event_attendee_id, :attended_event_id)
  end
end
