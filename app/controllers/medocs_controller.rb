class MedocsController < ApplicationController
  before_action :authenticate_veterinarian!

  expose(:medoc, attributes: :medoc_params)

  def new
  end

  def create
    if medoc.save
      redirect_to dictionaries_path(tab: 'medocs'), notice: 'Médicament ajouté avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if medoc.save
      redirect_to dictionaries_path(tab: 'medocs'), notice: 'Médicaments modifié avec succès.'
    else
      render :edit
    end
  end

  private

  def medoc_params
    params.require(:medoc).permit(:name, :status)
  end
end
