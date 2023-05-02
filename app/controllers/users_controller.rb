class UsersController < ApplicationController
    before_action :set_user, only: %w(show edit update destroy)

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        redirect_to tasks_path, notice: 'アカウントを登録しました'
      else
        render :new
      end
    end

    def show
    end

    def  edit

    end

    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'アカウントを更新しました'
      else
        render :edit
      end
    end

    def  destroy
      @user.destroy
      redirect_to new_user_path
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end     
end
