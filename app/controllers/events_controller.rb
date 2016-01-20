class EventsController < ApplicationController
	def index
		@user = User.find(params[:id])
		@events = Event.all.where(state: @user.state)
		@events_far = Event.all.where.not(state: @user.state)
	end
	def create
		event = Event.new(event_params)
		if event.save
			flash[:success] = "Successfuly added event"
			redirect_to "/events/#{session[:user_id]}"
		else 
			flash[:errors] = user.errors.full_messages
			redirect_to "/events/#{session[:user_id]}"
		end
	end

	def attend
		attend = Attend.new(user_id: params[:user_id], event_id: params[:event_id])
		if attend.save
			flash[:success] = "Successfuly added attend"
			redirect_to "/events/#{params[:user_id]}"
		else 
			flash[:errors] = user.errors.full_messages
			redirect_to "/events/#{params[:user_id]}"
		end
	end

	private
		def event_params
			params.require(:event).permit(:name, :date, :location, :state, :user_id)
		end
end
