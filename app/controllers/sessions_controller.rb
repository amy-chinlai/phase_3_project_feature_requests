class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase) 
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to requests_path
        else
            redirect_to '/login', alert: "Your username and password combination is invalid!"
        end
    end

    def destroy
        log_out
        redirect_to '/signup', alert: "You are now logged out!"
    end

end