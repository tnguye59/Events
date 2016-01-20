class UsersController < ApplicationController
	def index
		render :index
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			flash[:success] = "Successfuly added user"
			redirect_to "/events/#{user.id}"
		else 
			flash[:errors] = user.errors.full_messages
			redirect_to "/"
		end
	end
	def update
		user = User.find(params[:id])
		if user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state])
			redirect_to "/events/#{params[:id]}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/#{params[:id]}"
		end
	end

	def profile
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
		end
end
