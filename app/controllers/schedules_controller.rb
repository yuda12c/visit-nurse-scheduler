class SchedulesController < ApplicationController
  def index
    @selected_weekday = params[:weekday] || "月"
    @users = User.all.select do |user|
      user.workdays.present? && user.workdays.split(",").include?(@selected_weekday)
    end
    @schedules = Schedule.includes(:client).where(weekday: @selected_weekday)
  end

  def new
    @schedule = Schedule.new
    @schedule.sub_user_id = nil
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path, notice: "スケジュールを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
  
    respond_to do |format|
      format.js   # destroy.js.erb を返す
      format.html { redirect_to schedules_path, notice: "削除しました" }
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    respond_to do |format|
      format.html { render partial: "detail", locals: { schedule: @schedule } }
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    respond_to do |format|
      format.html { render partial: "form", locals: { schedule: @schedule }, layout: false }
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path(weekday: @schedule.weekday), notice: 'スケジュールを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :sub_user_id, :client_id, :weekday, :timeslot, :duration, :memo, :start_time, :end_time)
  end
end
