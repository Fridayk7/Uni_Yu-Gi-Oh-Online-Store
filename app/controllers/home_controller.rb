class HomeController < ApplicationController
skip_before_action :logged_in?, only:[:index]
  def index
    @top3 = Stock.order("purchases DESC").first(3)
    #hash = YugiohApiService.new

    #@image = hash.get_card_image("Dark Magician")
  end
end
