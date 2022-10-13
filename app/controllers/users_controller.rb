class UsersController < ApplicationController
  def show
    @events = current_user.attended_events
  end
end
