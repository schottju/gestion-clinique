class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :authenticate_veterinarian!, except: [ :help_page, :about ]

  def dictionaries
    case params[:tab]
      when 'units' then @units = Unit.order(sort_column + " " + sort_direction).paginate(page: params[:units_page], per_page: 8)
      when 'species' then @species = Species.order(sort_column + " " + sort_direction).paginate(page: params[:species_page], per_page: 8)
      when 'diseases' then @diseases = Disease.order(sort_column + " " + sort_direction).paginate(page: params[:diseases_page], per_page: 8)
      when 'treatments' then @treatments = Treatment.order(sort_column + " " + sort_direction).paginate(page: params[:treatments_page], per_page: 8)
      when 'medocs' then @medocs = Medoc.order(sort_column + " " + sort_direction).paginate(page: params[:medocs_page], per_page: 8)
    end
  end

  def units_search
    @units = Unit.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:units_page], per_page: 8)
    params[:tab] = 'units'
  end

  def species_search
    @species = Species.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:species_page], per_page: 8)
    params[:tab] = 'species'
  end

  def diseases_search
    @diseases = Disease.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:diseases_page], per_page: 8)
    params[:tab] = 'diseases'
  end

  def treatments_search
    @treatments = Treatment.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:treatments_page], per_page: 8)
    params[:tab] = 'treatments'
  end

  def medocs_search
    @medocs = Medoc.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:medocs_page], per_page: 8)
    params[:tab] = 'medocs'
  end

  def help_page
  end

  def about
  end

  private

    def sort_column
      case params[:tab]
        when 'units' then Unit.column_names.include?(params[:sort]) ? params[:sort] : "name"
        when 'species' then Species.column_names.include?(params[:sort]) ? params[:sort] : "name"
        when 'diseases' then Disease.column_names.include?(params[:sort]) ? params[:sort] : "name"
        when 'treatments' then Treatment.column_names.include?(params[:sort]) ? params[:sort] : "name"
        when 'medocs' then Medoc.column_names.include?(params[:sort]) ? params[:sort] : "name"
        else 'name'
      end
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
