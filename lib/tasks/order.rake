namespace :order do
  desc "TODO"
  task seed_orders: :environment do
    Order.destroy_all

   @users = User.limit(10).order("RANDOM()")
   @users.each do |user|
     rand(1..10).times do |index|
     stock = Stock.order("RANDOM()").first
     n = stock.quantity.to_i
     quantity = rand(1..n)
     while quantity > stock.quantity.to_i do
       quantity = rand(1..n)
     end
     stock.quantity = stock.quantity.to_i - quantity.to_i
     stock.save
          Order.create!(
            user: user,
            stock: stock,
            quantity: quantity
          )
        end
        puts user.name + " done"
      end
  end
end
