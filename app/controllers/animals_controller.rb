# coding: utf-8
class AnimalsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :authenticate_user!, only: [ :index, :show ]
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]
  expose(:proprio) { Proprio.find(params[:proprio_id]) }
  expose(:medical_record) { Medical_record.find(params[:Medical_record_id]) }
  expose(:animal, attributes: :animal_params)
  expose(:animals) { proprio.animals.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8) }

#  def searchas
#    @animals = Animal.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:proprios_page], per_page: 20)
#  end

  def index
    if params[:search]
      self.animals = Animal.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @hospits = proprio.hospits.order(created_at: :desc).limit(8)
    @pictures = animal.pictures.order(:created_at).paginate(page: params[:pictures_page], per_page: 10)
    @medical_records = animal.medical_records.order(:created_at).paginate(page: params[:medical_records_page], per_page: 10)
#    @animal1 = animal.medical_records.order(:id).map { |animal|  [ "Nom: #{animal.name}"] }
  end

  def new
    @species = Species.order(:name).where(:status => 'actif')
  end

  def create
    animal.weight = change_comma_to_period(params[:animal][:weight])
    animal.age = change_comma_to_period(params[:animal][:age])
    if animal.save
      redirect_to proprio_animals_path, notice: 'Animal crée avec succès.'
    else
      @species = Species.order(:name).where(status: "actif")
      render :new
    end
  end

  def edit
    @species = Species.order(:name).map do |s|
      ["#{s.name} #{"(Inactif)" if s.inactif?}", s.id]
    end
  end

  def update
    animal.weight = change_comma_to_period(params[:animal][:weight])
    animal.age = change_comma_to_period(params[:animal][:age])
    if animal.save
      redirect_to proprio_animals_path, notice: 'Animal modifié avec succès.'
    else
      @species = Species.order(:name).map { |s| [ "#{s.name} #{"(Inactif)" if s.inactif?}", s.id ] }
      render :edit
    end
  end

  private

    def animal_params
      params.require(:animal).permit(:id_number, :name, :birth_date, :statut,
                                     :weight, :gender, :age, :description,
                                     :proprio_id, :species_id)
    end

    def sort_column
      Animal.column_names.include?(params[:sort]) ? params[:sort] : "id_number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
