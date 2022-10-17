class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: :attended_event_id

  has_many :attendees, through: :event_attendees, source: :event_attendee

  has_many :invites
  
  default_scope { order(date: :desc)}

  scope :past, -> { where("date < ?", DateTime.current) }

  scope :upcoming, -> { where("date > ?", DateTime.current) }

  def is_upcoming?
    Event.upcoming.include?(self)
  end

  def guests
    User.joins(:event_attendees)
  end

  def invited_users
    User.joins(:invites).where("invites.event_id = ? ", self)
  end

  def uninvited_users
    User.where.not(id: self.invited_users, id: self.attendees)
  end
end
