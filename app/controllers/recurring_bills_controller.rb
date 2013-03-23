class RecurringBillsController < ApplicationController
  before_filter :fetch_recurring_bill, except: [:index, :new, :create]

  def index
    @recurring_bills = BillingSchedule.all
  end

  def show
  end

  def new
    @recurring_bill = BillingSchedule.new
  end

  def edit
  end

  def create
    @recurring_bill = BillingSchedule.new(params[:recurring_bill])

    if @recurring_bill.save
      redirect_to recurring_bills_path, notice: 'Billing schedule was successfully created.'
    else
      render :new
    end
  end

  def update
    if @recurring_bill.update_attributes(params[:recurring_bill])
      redirect_to recurring_bills_path, notice: 'Billing schedule was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recurring_bill.destroy

    redirect_to recurring_bills_path
  end

private
  
  def fetch_recurring_bill
    @recurring_bill = BillingSchedule.find(params[:id]).decorate
  end
end