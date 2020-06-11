class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :signin, :create]
    
    
    def new
        
    end
    
    def create
        user = User.new(username: params[:session][:username], password: params[:session][:password])
        if user.save
            flash[:notice] = "Welcome to chat with Morris"
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:notice] = "User Name has been taken"
            render 'new'
        end
    end
    
    def signin
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:success] = "#{user.username} have successfully logged in"
          redirect_to root_path
        else
          flash.now[:error] = "There was something wrong with your login information"
          render 'new'
        end
    end
    
    def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
    end
    
    private
    
    def logged_in_redirect
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end

end
