class InvitesController < ApplicationController
  before_action :authenticate_user!

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save!
      redirect_to event_path(params[:event])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:user, :event)
  end


end
