class PointsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
    @event = Event.find(params[:event_id])
    @team = Team.find(params[:team_id])
    @point = Point.where(team_id: @team.id)
  end

  def new
    @event = Event.find(params[:event_id])
    @team = Team.find(params[:team_id])
    @point = Point.new
  end

  def create
    @event = Event.find(params[:event_id])
    @team = Team.find(params[:team_id])
    @point = Point.new(point_params)
    if @point.save
      redirect_to event_team_points_path(@event, @team), notice: 'Poin berhasil disimpan'
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
  def point_params
    params.require(:point).permit(:nilai, :keterangan, :team_id, :oleh)
  end
end
