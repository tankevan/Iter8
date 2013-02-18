class ActionsController < ApplicationController

	def index
	end

	def new
	end

	def create
		@post = Post.find(params[:post_id])
		@action = @post.actions.build(:action => params[:new_action])
		@iterable = current_user.iterables.find(@post.iterable_id)
		if @action.save
			flash[:success] = "Action created!"
			redirect_to iterable_path(@iterable)
			@iterable.touch
		else
			flash[:notice] = "Unable to create action"
			redirect_to new_post_comment_path(@post)
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@action = Action.find(params[:action_id])
		if @action.destroy
			flash[:success] = "Action deleted!"
		else
			flash[:notice] = "Unable to delete action"
		end
		redirect_to iterable_path(params[:id])
	end

end
