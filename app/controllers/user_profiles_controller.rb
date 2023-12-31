class UserProfilesController < ApplicationController
    before_action :authenticate_user_by_token

    def index 
        if !params[:selectedType]
            @users = User.all
        else
            @users = User.where(selectedType: params[:selectedType])
        end
        if !@users.nil?
            render json: @users
        else
            render json: {message: "No users found"}, status: :ok
        end
    end

    def userDashboard
        render json: @user
    end

    def updateLevel
        if @user.update(level: params[:level])
            render json: {message: "OK"}
        else
            render json: {message: "NOT OK"}
        end
    end


    private

    def authenticate_user_by_token
        token = request.headers['Authorization']&.split(' ')&.last
        @user = User.find_by(auth_token: token)
        if @user.nil?
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end
end
