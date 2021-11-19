module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def user_by_param
        @user = User.find_by_id(params[:id])
      end

    def authenticated?
        logged_in? && current_user == user_by_param
    end

end