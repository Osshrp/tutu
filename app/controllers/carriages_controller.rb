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
    @carriage = class_name(params["class_id"]).constantize.new(carriage_params)

    if @carriage.save
      redirect_to edit_carriage_path(@carriage, notice: 'Carriage was successfully created.')
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriages_path(@carriage, notice: 'Carriage was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url, notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id,
      :upper_places, :bottom_places, :side_upper_places,
      :side_bottom_places)
  end

  def class_name(id)
    car_type = { '1' => 'FirstClassCarriage', '2' => 'SecondClassCarriage',
             '3' => 'ThirdClassCarriage', '4' => 'CouchCarriage'}
    car_type[id] if car_type.key?(id)
  end
end
