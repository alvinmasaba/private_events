class UsersController < ApplicationController
  def show
    @events = Event.where(user_id: params[:id])
  end
end