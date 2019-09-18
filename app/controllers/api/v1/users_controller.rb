class Api::V1::UsersController < ApplicationController

  def create
    email = user_params[:email]
    pass = user_params[:password]
    pass_conf = user_params[:password_confirmation]
    @user = User.new(email: email)
    @user.password = pass
    if (pass == pass_conf) && @user.save!
      render status: :created, json: {api_key: @user.api_key}
    elsif (pass != pass_conf)
      render json: {code: 3000, message: "Password and Password Confirmation need to be identical."}, status: 400
    else
      render json: {status: "error", code: 3001, message: "An unexpected error occured."}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
