class UsersController < ApplicationController
#   POST /users
#   POST /users.json
     def create
       @user = User.new(params[:user])

       respond_to do |format|
         if @user.save
           # Tell the UserMailer to send a welcome email after save
           UserMailer.welcome_email(@user).deliver_later

           format.html { redirect_to(@user, notice: 'User was successfully created.') }
           format.json { render json: @user, status: :created, location: @user }
         else
           format.html { render action: 'new' }
           format.json { render json: @user.errors, status: :unprocessable_entity }
         end
       end
     end

     helper_method :sort_column, :sort_direction

     before_action :authenticate_user!, only: [ :show_profile ]
     before_action :authenticate_veterinarian!, only: [ :index, :show, :edit, :update ]

     expose(:user, attributes: :user_params)
     expose(:veterinarian, attributes: :user_params)
     expose(:veterinarians) { User.where(role: 0).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8) }

     def index
       if params[:search]
         self.veterinarians = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 8)
       end
     end

     def edit
       user.build_address if user.address.nil?
     end

     def update
       if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
         params[:user].delete(:password)
         params[:user].delete(:password_confirmation)
       end

       if user.update(user_params)
         redirect_to user_path(user), notice: "L'utilisateur a été modifié avec succès."
       else
         render :edit
       end
     end

     private

       def user_params
         params.require(:user).permit(:first_name, :last_name, :phone_number, address_attributes:
             [ :id, :street, :house_number, :flat_number, :city, :country, :zip_code, :user_id ])
       end

       def sort_column
         User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
       end

       def sort_direction
         %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
       end
   end
