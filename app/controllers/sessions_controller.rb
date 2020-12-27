class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
    
        return redirect_to login_path unless user
    
        session[:user_id] = user.id
    
    
        redirect_to home_path
    end

    # def create
    #     user = User.find_by(name: params[:name])
    #     if user && user.authenticate(params[:password])
    #        session[:user_id] = user.id
    #        redirect_to home_path
    #     else
    #        redirect_to login_path
    #     end
    # end
end