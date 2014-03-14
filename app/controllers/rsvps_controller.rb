class RsvpsController < ApplicationController
  def edit
    puts params
    @rsvp = Rsvp.where(code: params[:q]).first
  end

  def update
    @rsvp = Rsvp.find(params[:rsvp][:id])
    params[:rsvp][:responded] = true

    if @rsvp.update_attributes(params[:rsvp])
      redirect_to controller: "pages", action: "home", notice: "Thanks"
    end
  end

  def index
    @comments = []
    @coming = []
    @notComing = []
    Rsvp.where(responded: true).each do |r|
      @comments.append([r.getNamesForRsvp, r.comments]) unless r.comments.blank?
      @coming.append(r.getInvitees(true))
      @notComing.append(r.getInvitees(false))
    end

    @notResponded = []
    Rsvp.where(responded: false).each do |r|
      @notResponded += r.invitee.map { |i| i.name }
    end

    # coming, not coming, not responded, total
    @totals = [Invitee.where(comming: true).size, Invitee.where(comming: false).size, @notResponded.size, Invitee.count]

  end
end
