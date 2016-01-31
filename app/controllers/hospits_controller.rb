# coding: utf-8
class HospitsController < ApplicationController

prawnto :prawn => {:page_size => 'A4'}
helper_method :sort_column, :sort_direction

#  before_filter :medical_records
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update]
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]
  expose(:medoc, attributes: :medoc_params)
  expose(:hospit, attributes: :hospit_params)
  expose(:user) { User.find(params[:user_id]) }
  expose(:proprio) { Proprio.find(params[:proprio_id]) }
#  expose(:veterinarian) { Veterinarian.find(params[:user_id]) }
  expose(:hospits) { proprio.hospits.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8) }


  def index
    if params[:search]
      self.hospits = Hospit.search(params[:search], params[:proprio_id]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
  end

  def new
#    @veterinarians = Veterinarian.where.map { |user| [ "Nom: #{user.last_name}, Prénom: #{user.first_name}"] }
    @hospit = Hospit.new
    @units = Unit.order(:name).where(status: "actif")
    @diseases = Disease.order(:name).where(status: "actif")
    @medocs = Medoc.order(:name).where(status: "actif")
    @treatments = Treatment.order(:name).where(status: "actif")
    @pictures = Picture.where(proprio_id: proprio.id).map { |picture| [ "Nom: #{picture.name}, Description: #{picture.description}", picture.id  ] }
    @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "ID: #{animal.id_number}, nom: #{animal.name}, #{animal.try(:species).try(:name)}, #{animal.description}", animal.id ] }
#    resource.build_medoc
  end

  def create
#    medical_record.additional_cost = change_comma_to_period(params[:hospit][:additional_cost])
    @hospit = Hospit.new
#    params[:hospit][:hospitactes_attributes].values.each_with_index do |hospitacte, i|
#      hospit.hospitactes[i].comment = change_comma_to_period(hospitacte[:comment])
#      hospit.hospitactes[i].soin = change_comma_to_period(hospitacte[:soin])
#    end if params[:hospit] and params[:hospit][:hospitactes_attributes]

    if hospit.save
      redirect_to proprio_hospits_path, notice: 'Nouvelle entrée dans le fichier crée.'
    else
#      @veterinarians = Veterinarian.find(params[:user_id]).map { |user| [ "Nom: #{user.last_name}, Prénom: #{user.first_name}"] }
      @units = Unit.order(:name).where(status: "actif")
      @medocs = Medoc.order(:name).where(status: "actif")
      @diseases = Disease.order(:name).where(status: "actif")
      @treatments = Treatment.order(:name).where(status: "actif")
      @pictures = Picture.where(proprio_id: proprio.id).map { |picture| [ "Nom: #{picture.name}, description: #{picture.description}", picture.id  ] }
      @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "ID: #{animal.id_number}, nom: #{animal.name}, #{animal.try(:species).try(:name)}, #{animal.description}", animal.id ] }
      render :new
    end
  end

  def edit
#    @veterinarians = Veterinarian.find(params[:user_id]).map { |user| [ "Nom: #{user.last_name}, Prénom: #{user.first_name}"] }
#    @hospit = Hospit.new(entry_params)
    @units = Unit.order(:name).map { |unit| [ "#{unit.name} #{"(Inactif)" if unit.inactif?}", unit.id ] }
    @medocs = Medoc.order(:name).map { |medoc| [ "#{medoc.name} #{"(Inactif)" if medoc.inactif?}", medoc.id ] }
    @diseases = Disease.order(:name).map { |disease| [ "#{disease.name} #{"(Inactif)" if disease.inactif?}", disease.id ] }
    @treatments = Treatment.order(:name).map { |treatment| [ "#{treatment.name} #{"(Inactif)" if treatment.inactif?}", treatment.id ] }
    @pictures = Picture.where(proprio_id: proprio.id).map { |picture| [ "Nom: #{picture.name}, description: #{picture.description}", picture.id  ] }
    @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "ID: #{animal.id_number}, nom: #{animal.name}, #{animal.try(:species).try(:name)}, #{animal.description}", animal.id ] }
#    resource.build_medoc
  end

  def update
#    hospit.additional_cost = change_comma_to_period(params[:hospit][:additional_cost])

#    params[:hospit][:hospitactes_attributes].values.each_with_index do |hospitacte, i|
#      hospit.hospitactes[i].comment = change_comma_to_period(hospitacte[:comment])
#      hospit.hospitactes[i].soin = change_comma_to_period(hospitacte[:soin])
#    end if params[:hospit] and params[:hospit][:hospitactes_attributes]
#    @hospit = Hospit.new(entry_params)
    if hospit.save
      redirect_to proprio_hospit_path, notice: 'La fiche a été modifiée.'
    else
#      @veterinarians = Veterinarian.find(params[:user_id]).map { |user| [ "Nom: #{user.last_name}, Prénom: #{user.first_name}"] }
      @units = Unit.order(:name).map { |unit| [ "#{unit.name} #{"(Inactif)" if unit.inactif?}", unit.id ] }
      @medocs = Medoc.order(:name).map { |medoc| [ "#{medoc.name} #{"(Inactif)" if medoc.inactif?}", medoc.id ] }
      @diseases = Disease.order(:name).map { |disease| [ "#{disease.name} #{"(Inactif)" if disease.inactif?}", disease.id ] }
      @treatments = Treatment.order(:name).map { |treatment| [ "#{treatment.name} #{"(Inactif)" if treatment.inactif?}", treatment.id ] }
      @pictures = Picture.where(proprio_id: proprio.id).map { |picture| [ "Nom: #{picture.name}, description: #{picture.description}", picture.id  ] }
      @animals = Animal.where(proprio_id: proprio.id).map { |animal| [ "ID: #{animal.id_number}, nom: #{animal.name}, #{animal.try(:species).try(:name)}, #{animal.description}", animal.id ] }
#      resource.build_medoc
      render :edit
    end
  end




  private

    def hospit_params
      params.require(:hospit).permit(
          :anamnesis, :description, :comment, :poids, :proprio_id, :user_id, :veterinarian_id, :disease_id,
          treatment_ids: [], animal_ids: [],
          hospitactes_attributes: [ :id, :comment, :soin, :veterinarian_id, :_destroy ]
      )
    end

    def sort_column
      Hospit.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

#enregistrement de nouveaux medocs
