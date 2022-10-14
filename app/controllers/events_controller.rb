class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  before_action :is_invited?, only: [:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

    if @event.save!
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to current_user, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end

  def is_invited?
    @event = Event.find(params[:id])
    
    Invite.exists?(event_id: params[:id], user_id: current_user.id) || current_user.is_creator?(@event)
  end
end
