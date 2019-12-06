require 'faker'

namespace :payment do
  desc "TODO"
  task seed_payments: :environment do
Payment.destroy_all
    @users = User.all

    @users.each do |user|
      @orders = Order.where(user: user)
      if @orders != nil
        amount = 0
        @orders.each do |order|
        amount += order.stock.price.to_d
        payment =  Payment.create!(
          amount: amount,
          credit_card: CreditCard.where(user: user).first,
          user: user,
          pay_day: Faker::Date.between(from: 10.days.ago, to: Date.today)
          )
        order.payment = payment
        order.save
        stock = Stock.find_by(id: order.stock)
        if stock.purchases == nil
          stock.purchases = 0
        end
        stock.purchases += order.quantity.to_i
        stock.save
        puts payment.pay_day.to_s
        end
      end
      puts user.name + "done"
    end
  end
end
