class RelationshipsController < ApplicationController

    def create
        #byebug
        # user = User.find_by_id(params[:follow_id])
        # if user
        #     current_user.follow(params[:follow_id]) unless current_user.following?(user)
        # end
        user = User.find(params[:user_id])
        current_user.follow(user.id)
        redirect_back(fallback_location: users_path)
    end

    def destroy
        # Relationship.find(params[:id]).destroy
        user = User.find(params[:user_id])
        current_user.unfollow(user.id)
        redirect_back(fallback_location: users_path)
    end

end
