class PicturesController < ApplicationController
  helper_method :sort_column, :sort_direction

#  before_action :authenticate_proprio!, only: [ :index, :show ]
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]
  expose(:animal) { Animal.find(params[:animal_id]) }
  expose(:proprio) { Proprio.find(params[:proprio_id]) }
  expose(:picture, attributes: :picture_params)
  expose(:pictures) { proprio.pictures.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8) }

  def index
    if params[:search]
      self.pictures = Picture.search(params[:search], params[:proprio_id]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @animals = Animal.where(proprio_id: proprio.id).map { |animal|  [ "Nom: #{animal.name}, Espèce: #{animal.try(:species).try(:name)}, Description: #{animal.description}", animal.id ] }
  end

  def new
    @animals = Animal.where(proprio_id: proprio.id).map { |animal|  [ "Nom: #{animal.name}, Espèce: #{animal.try(:species).try(:name)}, Description: #{animal.description}", animal.id ] }
  end

  def create
    if picture.save
      redirect_to proprio_pictures_path(proprio), notice: 'La photo a été crée avec succès.'
    else
      @animals = Animal.where(proprio_id: proprio.id).map { |animal|  [ "Nom: #{animal.name}, Espèce: #{animal.try(:species).try(:name)}, Description: #{animal.description}", animal.id ] }
      render :new
    end
  end

  def edit
    @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "Nom: #{animal.name}, Espèce: #{animal.try(:species).try(:name)}, Description: #{animal.description}", animal.id ] }
  end

  def update
    if picture.save
      redirect_to proprio_pictures_path(proprio), notice: 'La photo a été modifiée avec succès.'
    else
      @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "Nom: #{animal.name}, Espèce: #{animal.try(:species).try(:name)}, Description: #{animal.description}", animal.id ] }
      render :edit
    end
  end

  private

    def picture_params
      params.require(:picture).permit(:name, :description, :proprio_id, :image, :animal_id)
    end

    def sort_column
      Picture.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
