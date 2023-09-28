# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :idk, only: [:create]

  def create
    super do |user|
      if user.persisted?
        user.generate_authentication_token
        user.setSessionTime
        user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], selectedType: params[:user][:selectedType])
        render json: {
          message: "Account created",
          email: user.email,
          auth_token: user.auth_token,
          selectedType: user.selectedType
        }, status: :created
      else 
        render json: { error: user.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  private

  def idk
    @mypars = params[:user]
  end

  def respond_with(resource, options={})
  end
end
