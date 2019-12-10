class CartController < ApplicationController
  def show

    @user_orders = []
    @orders= Order.all
    hash = YugiohApiService.new
    @orders.each do |ord|
      if ord.user_id == current_user.id && ord.payment == nil
        ord.stock.price = hash.get_card_price(ord.stock.print_tag)
        ord.save
        @user_orders.push(ord)
      end
    end
        render template: "cart/#{params[:page]}"
  end
end
