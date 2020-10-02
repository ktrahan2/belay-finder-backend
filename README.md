# Belay Land

An app for finding climbing routes and connecting with other climbers. 

# Table Of Contents 
- [Description](https://github.com/ktrahan2/belay-finder-backend#description)
- [Example Code](https://github.com/ktrahan2/belay-finder-backend#example-code)
- [Technology Used](https://github.com/ktrahan2/belay-finder-backend#technology-used)
- [Setting up for the Application](https://github.com/ktrahan2/belay-finder-backend#setting-up-for-the-application)
- [Main Features](https://github.com/ktrahan2/belay-finder-backend#main-features)
- [Features in Progress](https://github.com/ktrahan2/belay-finder-backend#features-in-progress)
- [Contact Information](https://github.com/ktrahan2/belay-finder-backend#contact-information)
- [Link to Backend Repo](https://github.com/ktrahan2/belay-finder-backend#link-to-backend-repo)

## Description

Belay Land is an application that allows users to search through climbing routes near them and save them as favorites. Users are also able to request partnerships with other users in order to form connections to go climbing! 

## Example Code 

```
    def login
        @user = User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password])
            @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: @user, token: @token}
        else
            render json: { errors: "Invalid username or password, please try again!" }
        end
    end
```
```
     class ApplicationController < ActionController::API
    
        before_action :authorized

        def authorized
            render json: { message: "Please Log In" } unless logged_in
        end

        def logged_in
            !!current_user
        end

        def current_user
            auth_header = request.headers["Authorization"]
            if auth_header
                token = auth_header.split(" ")[1]
                begin 
                    @user_id = JWT.decode(token, secret_key)[0]["user_id"]
                rescue JWT::DecodeError
                    nil
                end
            end
            if @user_id
                @user = User.find(@user_id)
            else
                nil
            end
        end

        def secret_key
            Rails.application.secrets.secret_key_base[0]
        end

    end
```

## Technology Used

-Ruby on Rails
- SQLite

## Setting up for the application

To begin first run 
    
```
    rails db:migrate
``` 

and

```
    rails db:seed
```
    
then 
    
```
    rails s
```

## Main Features

- User can register/sign in
- User can find climbing routes and add them to their favorites
- User can friend other users in order to form climbing partnerships

## Features in Progress

- Adding a search feature to users and climbing routes
- Adding in a gps locator to find routes in your area

## Contact Information

[Kyle Trahan](https://www.linkedin.com/in/kyle-trahan-8384678b/)

## Link to Frontend Repo

https://github.com/ktrahan2/belay-finder-frontend

