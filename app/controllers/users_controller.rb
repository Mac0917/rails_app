class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            @user = User.new
            @error = "名前を入力してください"
            render :new
        end
    end

    def index
        redirect_to new_user_path
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :age)
    end
end
