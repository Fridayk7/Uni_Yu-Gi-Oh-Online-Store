class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
   @dates = Payment.select(:pay_day).map(&:pay_day).uniq
   @dates = @dates.sort
   puts @dates[0]
   total = 0
   @data = []
   @dates.each do |date|
     @amount = Payment.select(:amount).where(pay_day: date)
     @amount.each do |amount|
       total += amount.amount
     end
     @data.push(total)
     total = 0
   end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @orders = Order.all
    @credit_cards = CreditCard.where(user_id: current_user.id)
    @addresses = Address.where(user_id: current_user.id)
    @current_user_orders = []
    @user = current_user
    @final_price= 0
    @orders.each do |ord|
      if ord.user_id == current_user.id && ord.payment == nil
      @current_user_orders.push(ord)
      @final_price += ord.quantity.to_d * ord.stock.price.to_d
    end

  end
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @orders = Order.all
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if current_user != nil && @payment.save
      @orders.each do |ord|
        if ord.user_id == current_user.id
          ord.payment_id = @payment.id
          ord.save
          stock = ord.stock
          if stock.purchases == nil
            stock.purchases = 0
          end
          stock.purchases += ord.quantity.to_i
          stock.save
        end
      end
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase
    @payments = Payment.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :credit_card_id, :user_id, :payment_id, :address_id)
    end
end
