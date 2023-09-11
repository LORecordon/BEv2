# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    super do |user|
      if user.persisted?
        user.generate_authentication_token
        render json: {
          message: "Account created",
          email: user.email,
          auth_token: user.auth_token
        }, status: :created
      else 
        render json: { error: user.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  private

  def respond_with(resource, options={})
  end
end
