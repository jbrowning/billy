class PagesController < ApplicationController
  def home
      flash[:notice] = "Notice!"
      flash[:alert] = "Alert!"
  end
end
