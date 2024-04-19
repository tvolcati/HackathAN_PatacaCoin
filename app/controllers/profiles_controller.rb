class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show; end

  def update
    if params[:claim_tokens]
      @user.claimed_tokens += @user.unclaimed_tokens
      @user.unclaimed_tokens = 0
      if @user.save
        redirect_to profile_path(@user), notice: 'PatacaTokens successfully claimed.'
      else
        render :show, alert: 'Failed to claim PatacaTokens.'
      end
    else
      if @user.update(profile_params)
        redirect_to profile_path(@user), notice: 'Profile updated successfully.'
      else
        render :show
      end
    end
  end

  private

  def set_user
    @user = current_user  # Make sure this is secure and can only access the current user's profile
  end

  def profile_params
    params.require(:user).permit(:wallet_address, :claimed_tokens, :unclaimed_tokens)
  end
end
