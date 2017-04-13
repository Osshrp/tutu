class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_train, only: [:new, :purchase]
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to search_path
    end
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
