class UsersController < ApplicationController

    skip_before_action :authorized, only: [:show, :update, :create, :login]

    def index
        @users = User.all
        render json: UserSerializer.new(@users)
    end

    def profile
        render json: UserSerializer.new(@user)
    end
    
    def show 
        @user = User.find(params[:id])
        render json: UserSerializer.new(@user)
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: { user: @user, token: @token }
        else
            render json: { errors: @user.errors.messages }
        end
        
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def login
        @user = User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password])
            @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: @user, token: @token}
        else
            render json: { errors: "Invalid username or password, please try again!" }
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        
        render json: { messages: "User terminated" }
    end

    private 

    def user_params
    params.require(:user).permit(:username, :email, :password, :name, :climbing_skill, :climbing_style, :location, :belay_status, :aboutme)
    end


end
