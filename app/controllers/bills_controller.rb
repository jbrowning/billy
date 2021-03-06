class BillsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_bill, except: [:index, :new, :create]

  def index
    @bills = current_user.bills.unsettled.decorate
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
  end

  def update
    if @bill.update_attributes params[:bill]
      flash[:notice] = "bill updated"
      redirect_to bills_path
    else
      flash[:error] = "There was an error updating the bill"
      render :edit
    end
  end

  def destroy
    if @bill.destroy
      flash[:notice] = "Bill deleted"
    else
      flash[:error] = "There was a problem deleting the bill"
    end

    redirect_to bills_path
  end

  def pay
    @bill.pay!

    flash[:notice] = "'#{@bill.name}' has been paid"
    redirect_to bills_path
  end

  def settle
    @bill.settle!

    flash[:notice] = "'#{@bill.name}' has been settled"
    redirect_to bills_path
  end


  private

  def fetch_bill
    @bill = current_user.bills.find(params[:id])
  end
end
