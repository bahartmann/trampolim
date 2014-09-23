# -*- encoding: utf-8 -*-
class UserProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update_attributes(user_profile_params)
      redirect_to @user_profile
    else
      render "edit"
    end
  end

  private

  def user_profile_params
    params
      .require(:user_profile)
      .permit(:name, :about)
  end

end