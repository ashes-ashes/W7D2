class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            log_in(@user)
            redirect_to user_url(@user)
        else
            Flash.now << @user.errors.full_messages
            render :new
        end
    end

    def destroy
        log_out(current_user)
    end


end
