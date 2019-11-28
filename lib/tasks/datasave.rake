namespace :datasave do
  desc "TODO"
  task seed_datasave: :environment do
    allCards = Stock.all

    File.open("lib/assets/backupStocks.csv", "w") do |line|
      line.puts "card, set, printTag, price, quantity"

      allCards.each do |item|
        puts item.card_id.to_s + ',' + item.yugioh_set_id.to_s + ',' + item.print_tag.to_s + ',' + item.price.to_s + ',' + item.quantity.to_s
        line.puts item.card.name.to_s + ',' + item.yugioh_set.name.to_s + ',' + item.print_tag.to_s + ',' + item.price.to_s + ',' + item.quantity.to_s

      end
    end



  end

end
