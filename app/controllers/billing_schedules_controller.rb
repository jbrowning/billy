class BillingSchedulesController < ApplicationController
  before_filter :fetch_billing_schedule, except: [:index, :new, :create]

  def index
    @billing_schedules = BillingSchedule.all
  end

  def show
  end

  def new
    @billing_schedule = BillingSchedule.new
  end

  def edit
  end

  def create
    @billing_schedule = BillingSchedule.new(params[:billing_schedule])

    if @billing_schedule.save
      redirect_to billing_schedules_path, notice: 'Billing schedule was successfully created.'
    else
      render :new
    end
  end

  def update
    if @billing_schedule.update_attributes(params[:billing_schedule])
      redirect_to billing_schedules_path, notice: 'Billing schedule was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @billing_schedule.destroy

    redirect_to billing_schedules_path
  end

private
  
  def fetch_billing_schedule
    @billing_schedule = BillingSchedule.find(params[:id]).decorate
  end
end
