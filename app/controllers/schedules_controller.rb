class SchedulesController < ApplicationController
  def index
    selected_day = params[:weekday] || "月"
    @selected_weekday = selected_day
    @schedules = Schedule.includes(:client, :user).where(weekday: selected_day).order(:timeslot)
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

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :client_id, :weekday, :timeslot, :duration, :memo)
  end
end
