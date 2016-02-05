class HospitactesController < ApplicationController
  before_action :authenticate_veterinarian!

  expose(:hospitacte, attributes: :hosptiacte_params)

  def new
  end

  def create

  end

  def edit
  end

  def update

  end

  private

end
