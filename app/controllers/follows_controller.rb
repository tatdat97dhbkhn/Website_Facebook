class FollowsController < ApplicationController
  def track_follow
    @currentuser_id = params[:currentuser_id].to_i
    @followingid = params[:followingid].to_i

    @find_follow = Follow.exam_follow(@currentuser_id, @followingid).first
    @flag = 0
    if @find_follow
      @find_follow.destroy
    else
      Follow.create(user_id: @currentuser_id, following_id: @followingid)
      @flag = 1
    end
    @list_followers = Follow.list_followers(@followingid)
  end
end
