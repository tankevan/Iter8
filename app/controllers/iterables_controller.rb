class IterablesController < ApplicationController

	def index
		@iterables = current_user.iterables.all
	end

	def show
		@iterable = current_user.iterables.find(params[:id])
		@users = @iterable.users.all
		@posts = @iterable.posts.all
	end

	def new
	end

	def create
		if current_user.iterables.create(:name => params[:new_iterable])
			flash[:success] = "Iterable created!"
			redirect_to iterables_path
		else
			flash[:notice] = "Could not create iterable"
			redirect_to new_iterable_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@iterable = Iterable.find(params[:id])
		if @iterable.destroy
			flash[:success] = "Iterable deleted!"
		else
			flash[:notice] = "Unable to delete iterable"
		end
		redirect_to iterables_path
	end

end
