class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  skip_before_action :logged_in?, only:[:index]

  # GET /stocks
  # GET /stocks.json
  def index
    @yugioh_sets = YugiohSet.all
    @card_id = Card.find_by(name: params[:term].to_s)
    @stocks = Stock.search(params[:term],@card_id).paginate(page: params[:page])
    #@stocks = Stock.filter(params.slice(:print_tag, :price, :quantity)).paginate(page: params[:page])
      filtering_params(params).each do |key, value|
        @stocks = @stocks.public_send(key, value) if value.present?
      end

  end



  # GET /stocks/1
  # GET /stocks/1.json
  def show
    hash = YugiohApiService.new
    @stock = Stock.find(params[:id])
    @newprice = hash.get_card_price(@stock.print_tag)
    @stock.price = @newprice
    @stock.save
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def filtering_params(params)
  params.slice(:yugioh_set_id,:print_tag, :price, :quantity)
end


    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:card_id, :yugioh_set_id, :print_tag, :price, :quantity, :term)
    end
end
