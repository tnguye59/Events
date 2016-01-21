class CommentsController < ApplicationController
	def index
		@event = Event.find(params[:id])
		@comments = Comment.all.where(event_id: params[:id])
		@attends = @event.attends
	end

	def create
		comment = Comment.new(comment: params[:comment], user_id: session[:user_id], event_id: params[:event_id])
		if comment.save
			flash[:success] = "Successfuly added user"
			redirect_to "/comments/#{params[:event_id]}"
		else 
			flash[:errors] = user.errors.full_messages
			redirect_to "/comments/#{params[:event_id]}"
		end
	end
end
