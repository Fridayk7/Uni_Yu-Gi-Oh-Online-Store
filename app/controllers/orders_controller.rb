class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    if current_user.Admin_rights != true
      @orders = Order.where("user_id = ?","#{current_user.id}")
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = params[:id]
    @order = Order.find_by(id: @order)
    unless session[:user_id] == @order.user_id
      redirect_to "/pages/denied"
      return
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @users = User.all
    @stock = Stock.find(params[:stock_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @stock = Stock.find_by(id: @order.stock)
    respond_to do |format|
      if @order.quantity <= @stock.quantity && @order.save
        @stock.quantity = @stock.quantity.to_i - @order.quantity.to_i
        @stock.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    stock = Stock.find_by(id: @order.stock)
    stock.quantity = stock.quantity.to_i + @order.quantity.to_i
    stock.save
    if current_user.Admin_rights == true
      MyLog.debug "Order #{@Order.id}destroyed by user name #{current_user.name} with email #{current_user.email}"
    end
    @order.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :stock_id, :quantity)
    end
end
