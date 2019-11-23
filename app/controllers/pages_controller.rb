class PagesController < ApplicationController

  def show
    @user_orders = []
    @orders= Order.all
    render template: "pages/#{params[:page]}"
    end

  def purchase
    @orders= Order.all
    @orders.each do |ord|
     if ord.user_id == current_user.id
       ord.destroy
     end
    end
    redirect_back(fallback_location: root_path)
  end
end
