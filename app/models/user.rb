class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: :user_id, class_name: 'Event'

  has_many :events_attended, foreign_key: :event_attendee_id

  has_many :attended_events, through: :events_attended

  def is_attending?(event)
    AttendedEvent.exists?(:event_attendee_id => self.id, :attended_event_id => event.id)
  end
end
