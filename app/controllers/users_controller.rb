class UsersController < ApplicationController


    def index
        @users = User.all
        render json: UserSerializer.new(@users)
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            render json: @user
        else
            render json: { errors: @user.errors.messages}
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
            render json: { message: "Invalid username or password, please try again!" }
        end
    end

    private 

    def user_params
    params.require(:user).permit(:username, :email, :password, :name, :climbing_skill, :aboutme)
    end


end
