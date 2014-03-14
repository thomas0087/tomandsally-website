class RsvpsController < ApplicationController
  def edit
    puts params
    @rsvp = Rsvp.where(code: params[:q]).first
  end

  def update
    puts params
    puts "\n--\n"
    @rsvp = Rsvp.find(params[:rsvp][:id])
    puts @rsvp

    if @rsvp.update_attributes(params[:rsvp])
      redirect_to controller: "pages", action: "home", notice: "Thanks"
    end
  end

  def index
    @rsvps = Rsvp.all
    @invitees = Invitee.all
  end
end
