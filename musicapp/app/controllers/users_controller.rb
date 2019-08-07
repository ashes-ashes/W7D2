class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            render :show
        else
            flash.now << [@user.errors.full_messages]
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end


    private
    def user_params
        params.require(:user).permit(:email, :session_token, :password_digest, :password)
    end
end
