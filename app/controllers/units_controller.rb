class UnitsController < ApplicationController
  before_action :authenticate_veterinarian!

  expose(:unit, attributes: :unit_params)

  def new
  end

  def create
    if unit.save
      redirect_to dictionaries_path(tab: 'units'), notice: 'Unité ajoutée avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if unit.save
      redirect_to dictionaries_path(tab: 'units'), notice: 'Unité modifiée avec succès.'
    else
      render :edit
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :status)
  end
end
