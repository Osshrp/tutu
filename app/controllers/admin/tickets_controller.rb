class Admin::TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_tickets_path, notice: 'Билет был успешно изменен'
    else
      render :edit
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to admin_tickets_path, notice: 'Билет был успешно создан'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passport_number,
      :start_station_id, :end_station_id, :train_id, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
