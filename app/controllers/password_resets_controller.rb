class PasswordResetsController < ApplicationController

    def new 
    end

    def create 
        @user = User.find_by(email: params[:email])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        
        end
        redirect_to root_path, notice: "If an account with an email was found, we have set a link to reset your password. "

    end
end