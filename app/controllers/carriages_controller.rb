class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to edit_carriage_path(@carriage,
        notice: 'Carriage was successfully created.')
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriages_path(@carriage,
        notice: 'Carriage was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url, notice:
      'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id,
      :upper_places, :bottom_places, :side_upper_places,
      :side_bottom_places, :type)
  end
end
