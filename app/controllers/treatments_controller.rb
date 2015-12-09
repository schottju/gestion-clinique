class TreatmentsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :authenticate_veterinarian!, except: [ :index ]

  expose(:treatment, attributes: :treatment_params)

  def index
    @treatments = Treatment.order(sort_column + " " + sort_direction).where(status: "actif").paginate(page: params[:page], per_page: 8)
    if params[:search]
      @treatments = Treatment.price_page_search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  def new
  end

  def create
    treatment.cost = change_comma_to_period(params[:treatment][:cost])
    if treatment.save
      redirect_to dictionaries_path(tab: 'treatments'), notice: 'Le traitement a été ajouté avec succés.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    treatment.cost = change_comma_to_period(params[:treatment][:cost])
    if treatment.save
      redirect_to dictionaries_path(tab: 'treatments'), notice: 'Le traitement a été modifié avec succés.'
    else
      render :edit
    end
  end

  private

    def treatment_params
      params.require(:treatment).permit(:name, :cost, :description, :status)
    end

    def sort_column
      Treatment.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
