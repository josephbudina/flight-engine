class Api::V1::SessionsController < ApplicationController
  before_action :validate_params

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: { error: "Credentials are bad" }, status: :bad_request
    end
  end

  private

  def validate_params
    if request.body.read.blank?
      render json: { error: "Invalid Parameters" }, status: :bad_request
    end
  end
end