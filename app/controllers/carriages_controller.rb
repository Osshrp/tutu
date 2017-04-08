class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    @carriages = Carriage.where(train: @train)
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
      redirect_to train_carriages_path(@carriage.train, @carriage,
        notice: 'Carriage was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to train_carriages_path(@carriage.train, notice:
      'Carriage was successfully destroyed.')
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id,
      :upper_places, :bottom_places, :side_upper_places,
      :side_bottom_places, :type)
  end
end
