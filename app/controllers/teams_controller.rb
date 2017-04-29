class TeamsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
    @event = Event.find(params[:event_id])
    @team = Team.where(event_id: @event.id).order(id: :asc)
    @participant = Participant.where(event_id: @event.id)
    
    @peserta = Array.new
    @index = 0
    @team.each do |t|
      @p = Point.where(team_id: t.id).sum(:nilai)
      # if @peserta.empty?
        @peserta[@index] = [t, @p]
        @index += 1
      # else
        # @peserta.each_with_index do |pes, i|
        #   if @p > @peserta[i][1]
        #     @psr = @peserta[i]
        #     @peserta[i] = [t, @p]
        #     @p = @psr[1]
        #     @peserta[i+1]=@psr
        #   end
        # end
      # end
      
    end
    
    @peserta = @peserta.sort_by{|p| -p[1]}
  end

  # def participant
  #   @event = Event.find(params[:event_id])
  #   @team = Team.where(event_id: @event.id).order(id: :asc)
  #
  # end
  def input
    @event = Event.find(params[:format])
    @team = Team.where(event_id: @event.id).order(id: :asc)
    @participant = Participant.where(event_id: @event.id)
    
    @peserta = Array.new
    @index = 0
    @team.each do |t|
      @p = Point.where(team_id: t.id).sum(:nilai)
      @peserta[@index] = [t, @p]
      @index += 1
    end
     @peserta = @peserta.sort_by{|p| -p[1]}
  end
  
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
