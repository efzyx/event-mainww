class TeamsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
    @event = Event.find(params[:event_id])
    @team = Team.where(event_id: @event.id).order(id: :asc)
    @participant = Participant.where(event_id: @event.id)
  end

  # def participant
  #   @event = Event.find(params[:event_id])
  #   @team = Team.where(event_id: @event.id).order(id: :asc)
  #
  # end

  def new
    @event = Event.find(params[:event_id])
    @team = Team.new
  end

  def create
    @event = Event.find(params[:event_id])
    @team = Team.new(team_params)

    if @team.save
      redirect_to event_teams_path(@event), notice: 'Tim berhasil disimpan'
    else
      render :new
      flash[:warning] = 'Gagal simpan, periksa kembali'
    end
  end

  def edit
  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(:title, :event_id, :deskripsi)
  end
end
