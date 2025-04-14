class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      start_time = "#{params[:start_hour]}:#{params[:start_minute]}"
      end_time = "#{params[:end_hour]}:#{params[:end_minute]}"
      worktime_str = "#{start_time}-#{end_time}"
    
      @user = User.new(user_params.merge(worktime: worktime_str))
    
      if @user.save
        redirect_to root_path, notice: "ユーザーを登録しました。"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :worktime, :eligibility)
    end
  end

