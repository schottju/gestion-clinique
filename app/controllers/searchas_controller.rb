class SearchasController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]
  expose(:proprio) { proprio.find(params[:proprio_id]) }
  expose(:animal, attributes: :animal_params)


  def searchas_search
    @animals = Animal.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:animals_page], per_page: 20)
  end


  def index
    @animals = Animal.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 20)
  end

  private


    def animal_params
      params.require(:animal).permit(:id_number, :name, :statut, :gender, :proprio_id)
    end

    def sort_column
      Animal.column_names.include?(params[:sort]) ? params[:sort] : "id_number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
