class TicketsController < ApplicationController
  before_action :set_train, only: [:new, :purchase]
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    user = User.where(name: 'test').first
    @ticket.user_id = user
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def purchase
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    @ticket = Ticket.new
    render :new
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passport_number,
      :start_station_id, :end_station_id, :train_id)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
