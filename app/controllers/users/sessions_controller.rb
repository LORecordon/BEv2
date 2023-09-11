# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_action :checktoken, only: [:create]
  before_action :removetoken, only: [:destroy]

  def create
    super do |user|
      user.generate_authentication_token
      if user.persisted?
        render json: {
          message: "Account created",
          email: user.email,
          auth_token: user.auth_token
        }, status: :created
      else 
        render json: { error: "Invalid email or password"}, status: :unprocessable_entity
      end
    end
  end

  def destroy
    super do |user|
      render json: { message: "Signed Out" }
    end
  end

  private

  def checktoken
    user = User.find_by(email: params[:user][:email])
    if !user.nil?
      if user.auth_token != "0"
        render json: {message: "Already signed in", token: user.auth_token}
      end
    end
  end

  def removetoken
    token = request.headers['Authorization']&.split(' ')&.last
    puts token
    user = User.where(auth_token: token).first
    if !user.nil?
      user.remove_authentication_token
    else
      render json: {message: "Invalid token"}
    end
  end


  def respond_with(resource, options={})
  end

  def respond_to_on_destroy
  end
end
