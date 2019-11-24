class CartController < ApplicationController
  def show
    #<p > <%= button_to 'Purchase now', cart_purchase_path, method: :post %></p>
    @user_orders = []
    @orders= Order.all
    render template: "cart/#{params[:page]}"
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
