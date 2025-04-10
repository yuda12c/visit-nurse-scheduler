class SchedulesController < ApplicationController
  def index
    selected_day = params[:weekday] || "月"
    @selected_weekday = selected_day
    @schedules = Schedule.includes(:client, :user).where(weekday: selected_day).order(:timeslot)
    @users = User.order(:id)
  end

  def new
    @schedule = Schedule.new
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
    redirect_to schedules_path(weekday: @schedule.weekday), notice: "スケジュールを削除しました。"
  end

  def show
    @schedule = Schedule.find(params[:id])
    respond_to do |format|
      format.html { render partial: "detail", locals: { schedule: @schedule } }
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :client_id, :weekday, :timeslot, :duration, :memo, :start_time, :end_time)
  end
end
