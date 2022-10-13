class RenameAttendedEventsTableToEventAttendees < ActiveRecord::Migration[7.0]
  def change
    rename_table :attended_events, :event_attendees
  end
end
