class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      start_time = "#{params[:start_hour]}:#{params[:start_minute]}"
      end_time = "#{params[:end_hour]}:#{params[:end_minute]}"
      worktime_str = "#{start_time}-#{end_time}"
      workdays_array = params[:user][:workdays] || []
      workdays_str = workdays_array.join(",")
      
      @user = User.new(user_params.merge(worktime: worktime_str))
    
      if @user.save
        redirect_to root_path, notice: "ユーザーを登録しました。"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @user = User.find_by(id: params[:id])
      unless @user
        redirect_to users_path, alert: "ユーザーが見つかりませんでした"
      end
    end

    def edit
      @user = User.find(params[:id])
    end
    
    def update
      start_time = "#{params[:start_hour]}:#{params[:start_minute]}"
      end_time = "#{params[:end_hour]}:#{params[:end_minute]}"
      worktime_str = "#{start_time}-#{end_time}"
      workdays_array = params[:user][:workdays] || []
      workdays_str = workdays_array.join(",")
    
      @user = User.find(params[:id])
      if @user.update(user_params.merge(worktime: worktime_str, workdays: workdays_str))
        redirect_to @user, notice: 'ユーザー情報を更新しました'
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, notice: "ユーザーを削除しました"
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :worktime, :eligibility, workdays: [])
    end
  end

