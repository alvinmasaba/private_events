class RenameEventsAttendedToAttendedEvents < ActiveRecord::Migration[7.0]
  def change
    rename_table :events_attended, :attended_events
  end
end
