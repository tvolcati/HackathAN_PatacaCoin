class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show; end

  def update
    if @user.update(profile_params)
      redirect_to profile_path(@user), notice: 'Profile updated successfully.'
    else
      render :show
    end
  end

  private

  def set_user
    @user = current_user  # Make sure this is secure and can only access the current user's profile
  end

  def profile_params
    params.require(:user).permit(:wallet_address)
  end
end
