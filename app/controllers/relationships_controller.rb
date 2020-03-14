class RelationshipsController < ApplicationController

  before_action :set_user,{only: [:create, :destroy]}

  def index
    if params[:users] == 'followings'
      user = User.find(params[:id])
      @users = user.followings
    elsif params[:users] == 'followers'
      user = User.find(params[:id])
      @users = user.followers
    end
  end

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end

end
