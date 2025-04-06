class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.includes(:client).order(:weekday, :timeslot)
  end
end
