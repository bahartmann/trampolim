# -*- encoding: utf-8 -*-
class UserProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :get_user_profile
  before_action :authorize_user!, only: [:edit, :update]

  def get_user_profile
    @user_profile = UserProfile.find(params[:id])
  end    

  def authorize_user!
    unless @user_profile.id == current_user.user_profile.id
      flash[:alert] = "Você não pode editar este perfil."
      redirect_to user_profile_path(@user_profile)
    end
  end

  def edit
  end

  def show
  end

  def update
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
