class ParticipantsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @participant = Participant.where(event_id: @event.id).order(id: :desc)
  end

  def new
    @event = Event.find(params[:event_id])
    @participant = Participant.new
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(participant_params)
    if Participant.where(event_id: params[:participant][:event_id], tele_username: params[:participant][:tele_username]).empty?
      if @participant.save
        redirect_to event_participants_path(@event), notice: 'Peserta berhasil disimpan'
      else
        render :new
        flash[:warning] = 'Gagal simpan, periksa kembali'
      end
    else
      flash[:warning] = 'Username yang diinputkan sudah terdaftar'
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def participant_params
    params.require(:participant).permit(:display_name, :tele_username, :event_id)
  end
end
