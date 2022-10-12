class CreateEventsAttended < ActiveRecord::Migration[7.0]
  def change
    create_table :events_attended do |t|
      t.belongs_to :event_attendee
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
