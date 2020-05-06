class RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user) unless current_user.following?(@user)
		redirect_back(fallback_location: @user)
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow(@user)
		redirect_back(fallback_location: @user)
	end

end
