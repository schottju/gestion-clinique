class VeterinariansController < ApplicationController
  helper_method :sort_column, :sort_direction

  expose(:veterinarians) { User.where(role: 0).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8) }
#  expose(:user) { User.find(params[:user_id]) }

  def index
    if params[:search]
      self.veterinarians = Veterinarian.search(params[:search], params[:user_id]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  def show_calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @veterinarian = Veterinarian.find(params[:id])
  end

  def index_veterinarians
    if params[:search]
      self.veterinarians = Veterinarian.search(params[:search], params[:user_id]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
    end
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
