class IterablesusersController < ApplicationController

	def new
	end

	def create
		@iterable = current_user.iterables.find(params[:iterable_id])
		if @iterable.users << User.find_by_email(params[:new_user])
			flash[:success] = "User added!"
			redirect_to iterable_path(@iterable)
		else
			flash[:notice] = "Could not add user"
			redirect_to new_iterable_iterablesuser_path
		end
	end

	def destroy
		@iterable = current_user.iterables.find(params[:id])
		@user_deleted = User.find(params[:user_deleted])
		if @iterable.users.delete(@user_deleted)
			flash[:success] = "User deleted!"
		else
			flash[:notice] = "Could not delete user"
		end
		redirect_to iterable_path(@iterable)
	end

end
