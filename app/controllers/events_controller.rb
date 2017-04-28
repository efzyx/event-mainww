class EventsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  def index
    @events = Event.all.order(id: :asc)
  end

  # def pendaftaran
  #   @event = Event.find(params[:id])
  #   redirect_to @event, notice: 'Pendaftaran telah dirubah'
  # end

  def latest
      @event = Event.last
  end

  def show
      @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

      if @event.save
        redirect_to new_event_path, notice: 'Event berhasil disimpan'
      else
        render :new
        flash[:warning] = 'Gagal simpan, periksa kembali'
      end
  end

  def edit
  end

  def update
    @event = Event.find(params[:event][:id])
    if @event.is_open
      if @event.update(is_open: false)
        redirect_to @event
      end
    else
      if @event.update(is_open: true)
        redirect_to @event
      end
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:nama_event, :is_open, :deskripsi)
  end
end
