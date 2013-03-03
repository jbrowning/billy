class BillsController < ApplicationController
  def index
    @bills = current_user.bills.unsettled
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.bills.build(params[:bill])

    if @bill.save
      redirect_to bills_path
    else
      flash[:error] = @bill.errors.map(&:message).join(', ')
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def pay
    @bill = Bill.find(params[:id])
    @bill.update_attribute(:date_paid, Date.current)

    flash[:notice] = "'#{@bill.name}' has been paid"
    redirect_to bills_path
  end
end
