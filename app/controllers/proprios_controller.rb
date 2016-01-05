class PropriosController < ApplicationController
  helper_method :sort_column, :sort_direction

#  def create
#    @proprio = Proprio.new(params[:proprio])
#    proprio.first_name = change_comma_to_period(params[:proprio][:first_name])
#    proprio.last_name = change_comma_to_period(params[:proprio][:last_name])
#    proprio.phone_number = change_comma_to_period(params[:proprio][:phone_number])
#    if proprio.save
#      redirect_to proprio_path(proprio), notice: 'Propriétaire crée avec succès.'
#    else
#       render :new
#    end

#  end

#   before_action :authenticate_user!, only: [ :index, :show ]
   before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]

  expose(:proprio, attributes: :proprio_params)

  def proprios_search
    @proprios = Proprio.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:proprios_page], per_page: 20)
  end

#      self.proprios = Proprio.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 20)

  def index
    @proprios = Proprio.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 20)
  end

  def show
    @animals = proprio.animals.order(created_at: :desc).limit(3)
    @medical_records = proprio.medical_records.order(created_at: :desc).limit(8)
    @hospits = proprio.hospits.order(created_at: :desc).limit(8)
    @pictures = proprio.pictures.order(created_at: :desc).limit(3)
  end


  def update
    proprio.first_name = (params[:proprio][:first_name])
    proprio.last_name = (params[:proprio][:last_name])
    proprio.phone_number = change_comma_to_period(params[:proprio][:phone_number])
    proprio.street = (params[:proprio][:street])
    proprio.house_number = (params[:proprio][:house_number])
    proprio.flat_number = (params[:proprio][:flat_number])
    proprio.city = (params[:proprio][:city])
    proprio.country = (params[:proprio][:country])
    proprio.zip_code = (params[:proprio][:zip_code])
    if proprio.save
      redirect_to proprio_path(proprio), notice: 'Propriétaire modifié avec succès.'
   else
      render :edit
    end
  end


  def create
    proprio.first_name = (params[:proprio][:first_name])
    proprio.last_name = (params[:proprio][:last_name])
    proprio.phone_number = (params[:proprio][:phone_number])
    proprio.street = (params[:proprio][:street])
    proprio.house_number = (params[:proprio][:house_number])
    proprio.flat_number = (params[:proprio][:flat_number])
    proprio.city = (params[:proprio][:city])
    proprio.country = (params[:proprio][:country])
    proprio.zip_code = (params[:proprio][:zip_code])
    if proprio.save
      redirect_to proprio_path(proprio), notice: 'Propriétaire créé avec succès.'
   else
      render :new
    end
  end

  def show_profile
    if current_proprio?
      @animals = current_proprio.animals.order(created_at: :desc).limit(3)
      @medical_records = current_proprio.medical_records.order(created_at: :desc).limit(8)
      @hospits = proprio.hospits.order(created_at: :desc).limit(8)
      @pictures = current_proprio.pictures.order(created_at: :desc).limit(3)
    end
  end

  private

    def proprio_params
      params.require(:proprio).permit(
          :first_name, :last_name, :phone_number, :street, :house_number, :flat_number, :city, :country, :zip_code,
          contacts_attributes: [ :id, :chose, :info, :_destroy ]
      )
    end

    def sort_column
      Proprio.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
