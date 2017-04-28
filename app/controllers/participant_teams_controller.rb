class ParticipantTeamsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
  end

  def new
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    @participant = Participant.new
    @participant_av = Participant.where(team_id: nil)
  end

  def create
    @part = params[:participant]
    @participant = Participant.find(@part[:id])
    if @participant.update(team_id: @part[:team_id])
      redirect_to event_team_participant_teams_new_path, notice: 'Behasil'
    else
      render :new
      flash[:warning] = 'Gagal update, periksa kembali'
    end

  end

  def random
  end

  private
  def p_params
    params.require(:participant).permit(:team_id)
  end
end
