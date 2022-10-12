class AttendedEventsController < ApplicationController
  def new
    @attended_event = AttendedEvent.new
  end
end
