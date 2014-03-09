class UserFriendshipsController < ApplicationController

	before_filter :authenticate_user!, only: [:new]

	def new
		if params[:friend_id]
		  @friend = User.where(profile_name: params[:friend_id]).first
		  raise ActiveRecord::RecordNotFound if @friend.nil?
		  @user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend id is missing."
		end
	  rescue ActiveRecord::RecordNotFound 
	  	render 'public/404.html', status: :not_found
	end
end
