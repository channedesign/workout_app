class DashboardController < ApplicationController
  def index
  	@athletes = User.paginate(page: params[:page], per_page: 5)
  end
end
