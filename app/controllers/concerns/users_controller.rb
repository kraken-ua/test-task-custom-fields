class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def update
    if @user.update_custom_fields(custom_fields_params)
      render json: { message: 'Custom fields updated successfully' }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def custom_fields_params
    params.require(:custom_fields).permit!
  end
end
